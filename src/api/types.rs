use rand::Rng;
use serde::{Deserialize, Serialize};

#[derive(Serialize, sqlx::FromRow)]
pub struct Quote {
    pub id: uuid::Uuid,
    pub book: String,
    pub quote: String,
    pub inserted_at: chrono::DateTime<chrono::Utc>,
    pub updated_at: chrono::DateTime<chrono::Utc>,
}

impl Quote {
    pub fn new(book: String, quote: String) -> Self {
        let now = chrono::Utc::now();
        Self {
            id: uuid::Uuid::new_v4(),
            book,
            quote,
            inserted_at: now,
            updated_at: now,
        }
    }
}

#[derive(Debug, Deserialize)]
pub struct CreateQuoteRequest {
    pub book: String,
    pub quote: String,
}

#[derive(Serialize, sqlx::FromRow)]
pub struct Club {
    pub id: i32,
    pub club_name: String,
}

#[derive(Serialize, sqlx::FromRow)]
pub struct User {
    pub user_id: i32,
    pub first_name: String,
    pub last_name: String,
    pub full_name: String,
    pub and_title: String,
    pub club_id: i32,
}

impl User {
    pub fn new(first_name: String, last_name: String, and_title: String, club_id: i32) -> Self {
        let mut rng = rand::thread_rng();
        Self {
            first_name: first_name.clone(),
            last_name: last_name.clone(),
            and_title,
            club_id,
            full_name: format!("{} {}", &first_name, &last_name),
            user_id: rng.gen(),
        }
    }
}

#[derive(Debug, Deserialize)]
pub struct CreateUserRequest {
    pub first_name: String,
    pub last_name: String,
    pub and_title: String,
    pub club_id: i32,
}
