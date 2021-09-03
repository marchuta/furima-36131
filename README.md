# README

## users table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| nickname           |string| null: false |
| email              | string| null: false |
| encrypted_password | string| null: false |
| Kanji              | string| null: false |
| Kana               | text  | null: false |
| birthday           |text   | null: false |

### Association 
- has_one :address
- has_many :items

## items table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| image              | active storage  | null: false |
| name               | string| null: false |
| description        | text  | null: false |
| category           | string| null: false |
| condition          | string| null: false |
| carriage           | string| null: false |
| region             | string| null: false |
| days               | string| null: false |
| price              | string| null: false |


### Association 
- belongs_to :user
- has_one :address


## address table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| post_code          | string| null: false |
| prefecture         | string| null: false |
| city               | text  | null: false |
| block_number       | string| null: false |
| building           | text  | null: false |
| phone_number       | string| null: false |


### Association 
- belongs_to :user
- belongs_to :item


