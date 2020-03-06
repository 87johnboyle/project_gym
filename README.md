Brief

A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

MVP

Be able to add, update and delete members.
Be able to add, update and delete classes.
Be able to add and remove members from classes.

How to run

Requires: PostgreSQL

---
gem install Ruby, Sinatra, SQL, PG and Pry

---

psql -d gym -f db/gym.sql

---

ruby app.rb

---
