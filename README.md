# README

## users table
| Column                 | Type  | Options     |
| -----------------------| ------| ----------- |
| nickname               | string| null: false |
| email                  | string| null: false, unique: true |
| encrypted_password     | string| null: false |
| last_name_kanji        | string| null: false |
| first_name_kanji       | string| null: false |
| last_name_katakana     | string| null: false |
| first_name_katakana    | string| null: false |
| birthday               | date  | null: false |

### Association 

- has_many :items
- has_many :orders

## items table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| name               | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| carriage_id        | integer | null: false |
| region_id          | integer | null: false |
| day_id             | integer | null: false |
| price              | integer | null: false |
| user               | references| null: false, foreign_key: true |


### Association 
- belongs_to :user
- has_one :order


## orders table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| user               | references| null: false, foreign_key: true |
| item               | references| null: false, foreign_key: true |

### Association 
- belongs_to :user
- belongs_to :item
- has_one :address



## addresses table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| post_code          | string| null: false |
| region_id          |integer| null: false |
| city               | string| null: false |
| block_number       | string| null: false |
| building           | string| ----------- |
| phone_number       | string| null: false |
| order              | references| null: false, foreign_key: true |

### Association
- belongs_to :order







