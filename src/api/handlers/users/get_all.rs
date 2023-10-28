use axum::{extract, http};
use sqlx::PgPool;

use crate::api::types::User;

pub async fn get_users(
    extract::State(pool): extract::State<PgPool>,
) -> Result<axum::Json<Vec<User>>, http::StatusCode> {
    let res = sqlx::query_as::<_, User>("SELECT * FROM users")
        .fetch_all(&pool)
        .await;
    match res {
        Ok(users) => Ok(axum::Json(users)),
        Err(_) => Err(http::StatusCode::INTERNAL_SERVER_ERROR),
    }
}
