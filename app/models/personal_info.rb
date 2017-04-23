class PersonalInfo < ApplicationRecord
    validates_presence_of :name
    # 資料驗證功能，若:name為nil，把請求rollback

end
