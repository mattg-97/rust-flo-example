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
