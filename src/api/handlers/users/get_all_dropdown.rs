//'select full_name, user_id from users limit 8;'
use axum::{extract, http};
use sqlx::PgPool;

use crate::api::types::DropdownUser;

pub async fn get_users_for_dropdown(
    extract::State(pool): extract::State<PgPool>,
) -> Result<axum::Json<Vec<DropdownUser>>, http::StatusCode> {
    let res = sqlx::query_as::<_, DropdownUser>("SELECT full_name, user_id FROM users LIMIT 8")
        .fetch_all(&pool)
        .await;
    match res {
        Ok(users) => Ok(axum::Json(users)),
        Err(_) => Err(http::StatusCode::INTERNAL_SERVER_ERROR),
    }
}
