class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :solicitations, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true
  validates :cnpj, presence: true,
                   uniqueness: true,
                   format: { with: /\A(([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2}))\z/,
                             message: 'Invalid format' }
  validates :main_phone_number, presence: true,
                                uniqueness: true,
                                format: { with: /\A\(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b/,
                                          message: 'Invalid format' }
  validates :secondary_phone_number, uniqueness: true,
                                     format: { with: /\A\(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b/,
                                               message: 'Invalid format' }
  validates :main_address, presence: true,
                           uniqueness: true
  validates :secondary_address, uniqueness: true
end
