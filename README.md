# Dockerized API Rails Application for Chat System

This repository contains a Dockerized API built with Ruby on Rails for managing applications, chats, and messages within a chat system. This README provides an overview of the project structure, setup instructions, and usage guidelines.

## Features

- **Applications Management**: Create, read, and update applications.
- **Chats Management**: Create and read chat rooms within applications.
- **Messages Handling**: Create, read, and update messages within chat rooms.

## Technologies Used

- **Ruby on Rails**: Backend framework for building APIs.
- **MySQL**: Relational database for storing application data.
- **Redis**: In-memory data structure store, used in conjunction with Sidekiq for background job processing.
- **Elasticsearch**: Distributed search and analytics engine, used for full-text search functionality.
- **RSpec**: Testing framework for ensuring code quality.
- **Docker**: Containerization platform for easy deployment.
- **Docker Compose**: Tool for defining and running multi-container Docker applications.

## Setup Instructions

To run this application locally, make sure you have Docker and Docker Compose installed on your machine. Then follow these steps:

1. **Clone Repository**: `git clone https://github.com/YoussefGazzar/chat_system.git`
2. **Navigate to Project Directory**: `cd chat_system`
3. **Start Docker Compose**: `docker compose up`

This will build the necessary Docker images and start the containers. You can access the API at `http://localhost:3000`.

## Endpoints

| HTTP Verb | Path                                                                                   | Description                                                         | Parameters                           |
|-----------|----------------------------------------------------------------------------------------|---------------------------------------------------------------------|--------------------------------------|
| GET       | `/applications`                                                                         | Retrieve all applications.                                         |                                      |
| POST      | `/applications`                                                                         | Create a new application.                                          |                                      |
| GET       | `/applications/:token`                                                                  | Retrieve a specific application.                                   | `token`                              |
| PUT       | `/applications/:token`                                                                  | Update a specific application.                                     | `token`                              |
| GET       | `/applications/:application_token/chats`                                                | Retrieve all chats for a specific application.                    | `application_token`                  |
| POST      | `/applications/:application_token/chats`                                                | Create a new chat for a specific application.                     | `application_token`                  |
| GET       | `/applications/:application_token/chats/:number`                                         | Retrieve a specific chat for a specific application.              | `application_token`, `number`        |
| GET       | `/applications/:application_token/chats/:chat_number/search`                            | Search for messages within a specific chat.                       | `application_token`, `chat_number`   |
| GET       | `/applications/:application_token/chats/:chat_number/messages`                         | Retrieve all messages for a specific chat.                        | `application_token`, `chat_number`   |
| POST      | `/applications/:application_token/chats/:chat_number/messages`                         | Create a new message in a specific chat.                          | `application_token`, `chat_number`   |
| GET       | `/applications/:application_token/chats/:chat_number/messages/:number`                 | Retrieve a specific message in a chat.                            | `application_token`, `chat_number`, `number` |

## Testing

To run the test suite, execute the following command:

```bash
docker compose exec web bundle exec rspec
```