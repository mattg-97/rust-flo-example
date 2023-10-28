use axum::routing::{delete, get, post, put, Router};
use sqlx::postgres::PgPoolOptions;
use std::env;
mod api;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let port = std::env::var("PORT").unwrap_or_else(|_| "3000".to_string());
    let addr = format!("0.0.0.0:{}", port);

    let database_url = env::var("DATABASE_URL").expect("missing DATABASE_URL env");

    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&database_url)
        .await?;

    let app = Router::new()
        .route("/", get(api::handlers::health::health))
        .route("/user/add", post(api::handlers::users::add::create_user))
        .route("/user/get", get(api::handlers::users::get_all::get_users))
        .route(
            "/user/getdropdown",
            get(api::handlers::users::get_all_dropdown::get_users_for_dropdown),
        )
        .route(
            "/user/delete",
            delete(api::handlers::users::delete::delete_user),
        )
        .with_state(pool);

    axum::Server::bind(&addr.parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();

    Ok(())
}
