use axum::{extract, http};
use sqlx::PgPool;

use crate::api::types::CreateQuoteRequest;

pub async fn update_quote(
    extract::State(pool): extract::State<PgPool>,
    extract::Path(id): extract::Path<uuid::Uuid>,
    axum::Json(payload): axum::Json<CreateQuoteRequest>,
) -> http::StatusCode {
    let now = chrono::Utc::now();

    let res = sqlx::query(
        r#"
        UPDATE quotes
        SET book = $1, quote = $2, updated_at = $3
        WHERE id = $4
        "#,
    )
    .bind(&payload.book)
    .bind(&payload.quote)
    .bind(now)
    .bind(id)
    .execute(&pool)
    .await
    .map(|res| match res.rows_affected() {
        0 => http::StatusCode::NOT_FOUND,
        _ => http::StatusCode::OK,
    });

    match res {
        Ok(status) => status,
        Err(_) => http::StatusCode::INTERNAL_SERVER_ERROR,
    }
}
