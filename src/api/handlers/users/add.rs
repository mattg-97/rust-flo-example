use crate::api::types::{CreateUserRequest, User};
use axum::{extract, http};
use sqlx::PgPool;

pub async fn create_user(
    extract::State(pool): extract::State<PgPool>,
    axum::Json(payload): axum::Json<CreateUserRequest>,
) -> Result<(http::StatusCode, axum::Json<User>), http::StatusCode> {
    let user = User::new(
        payload.first_name,
        payload.last_name,
        payload.and_title,
        payload.club_id,
    );

    let res = sqlx::query(
        r#"
        INSERT INTO users (user_id, first_name, last_name, full_name, and_title, club_id)
        VALUES ($1, $2, $3, $4, $5, $6)
        "#,
    )
    .bind(user.user_id)
    .bind(&user.first_name)
    .bind(&user.last_name)
    .bind(&user.full_name)
    .bind(&user.and_title)
    .bind(user.club_id)
    .execute(&pool)
    .await;

    match res {
        Ok(_) => Ok((http::StatusCode::CREATED, axum::Json(user))),
        Err(_) => Err(http::StatusCode::INTERNAL_SERVER_ERROR),
    }
}
