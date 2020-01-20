class IncomeCollection < ApplicationRecord

    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    INCOME_NUM = 1  # 同時にユーザーを作成する数
    attr_accessor :collection  # ここに作成したユーザーモデルが格納される
  
    # 初期化メソッド
    def initialize(attributes = [])
      if attributes.present?
        self.collection = attributes.map do |value|
          Income.new(
            category: value['category'],
            price: value['price'],
            date: value['date'],
            memo: value['memo']
          )
        end
      else
        self.collection = INCOME_NUM.times.map{ Income.new }
      end
    end
  
    # レコードが存在するか確認するメソッド
    def persisted?
      false
    end
  
  
    # コレクションをDBに保存するメソッド
    def save
      is_success = true
      ActiveRecord::Base.transaction do
        collection.each do |result|
          # バリデーションを全てかけたいからsave!ではなくsaveを使用
          is_success = false unless result.save
        end
        # バリデーションエラーがあった時は例外を発生させてロールバックさせる
        raise ActiveRecord::RecordInvalid unless is_success
      end
      rescue
        p 'エラー'
      ensure
        return is_success
    end
  end