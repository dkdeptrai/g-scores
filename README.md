# G-Scores

G-Scores is a Ruby on Rails application to search and see some analytics of the Viet Nam High School Graduation Examination 2024

### Requirements

- Name: g-scores
- Ruby version: [3.3.4](https://www.ruby-lang.org/en/downloads/releases/)
- Rails version: [7.1.4](https://rubyonrails.org/)
- Bundler version: [2.55.2](https://bundler.io/)
- Database: [PostgreSQL](https://www.postgresql.org/)
- Redis: [6.2.6](https://redis.io/)

### Installation Steps

1. Clone the repository

```bash
git clone https://github.com/dkdeptrai/g-scores
```

2. Install dependencies

```bash
bundle install
```

3. Create database

```bash
rails db:create
```

4. Run migrations

```bash
rails db:migrate
```

5. Run the seeds.rb file (might take a while because of large dataset)

```bash
rails db:seed
```

6. Start the server

```bash
rails s
```

7. Open the browser and go to `http://localhost:3000`

### Live Demo
You can access the live demo [here](https://g-scores.fly.dev/)
