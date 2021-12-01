Welcome to your new dbt project!
### Setting up
```shell
# if you have conda you can use environment.yml
# or just install via your system pip
pip install dbt==0.21.1 dbt-snowflake==0.21.1

```

Put this into `~/.dbt/profiles.yml`

```yaml
my-snowflake-db:
  outputs:
    dev:
      type: snowflake
      account: jn29444.southeast-asia.azure
      user: tilakpr
      role: sysadmin
      password: <ask me for password>
      database: test
      schema: public

  target: dev


```

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
