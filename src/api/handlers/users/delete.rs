use axum::{extract, http};
use sqlx::PgPool;

pub async fn delete_user(
    extract::State(pool): extract::State<PgPool>,
    extract::Path(id): extract::Path<i32>,
) -> http::StatusCode {
    let res = sqlx::query(
        r#"
        DELETE FROM users
        WHERE id = $1
        "#,
    )
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
