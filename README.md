# README

## users table
| Column                 | Type  | Options     |
| -----------------------| ------| ----------- |
| nickname               | string| null: false |
| email                  | string| null: false, unique: true |
| encrypted_password     | string| null: false |
| last_name_Kanji        | string| null: false |
| first_name_Kanji       | string| null: false |
| last_name_Katakana     | string| null: false |
| first_name_Katakana    | string| null: false |
| birthday               | date  | null: false |

### Association 

- has_many :items

## items table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |

| name               | string  | null: false |
| description        | text    | null: false |
| category           | integer | null: false |
| condition          | integer | null: false |
| carriage           | integer | null: false |
| region             | integer | null: false |
| days               | integer | null: false |
| price              | integer | null: false |
| user               | references| null: false, foreign_key: true |


### Association 
- belongs_to :user


## register table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| user               | references| null: false, foreign_key: true |
| item               | references| null: false, foreign_key: true |

### Association 
- belongs_to :user
- belongs_to :item



## address table
| Column             | Type  | Options     |
| ----------------   | ------| ----------- |
| post_code          | string| null: false |
| region             |integer| null: false |
| city               | string| null: false |
| block_number       | string| null: false |
| building           | string| ----------- |
| phone_number       | string| null: false |







