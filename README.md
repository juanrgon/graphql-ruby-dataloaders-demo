# Dataloaders Demo

This repo is a demo of graphql-ruby Dataloaders.

It also includes a reproduction of an issue with Dataloaders and errors: https://github.com/rmosolgo/graphql-ruby/issues/5020

## Setup

### Ensure you have Ruby installed

Before you begin, make sure you have ruby installed:

```sh
ruby --version
```

If you don't have it installed, I recommend using [rbenv](https://github.com/rbenv/rbenv):

```sh
brew install rbenv
rbenv install
```

### Install dependencies

```sh
bundle install
```

## Guide

### Basic Schema

First, open the `no-dataloader.rb` script to see what a basic schema looks like without dataloaders.

To execute the script, run

```sh
bundle exec ruby no-dataloader.rb
```

### Basic Dataloader Example

Next, open the `with-dataloader.rb` script to see what a basic schema looks like with dataloaders.

To execute the script, run

```sh
bundle exec ruby with-dataloader.rb
```

### Reproduction of Issue https://github.com/rmosolgo/graphql-ruby/issues/5020

Finally, open the issue reproduction script `issue-5020.rb` to see the issue in action.

To execute the script, run

```sh
bundle exec ruby issue-5020.rb
```
