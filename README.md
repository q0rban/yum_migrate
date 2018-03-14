## Example SQL to Text Paragraph migration

This module is an example Yum migration from a somewhat normalized SQL structure
instead of direct from XML.

### Installation

- Download this module to `web/modules/custom/yum_migrate`.
- Ensure dependencies are met
```
$ composer require drupal/migrate_plus:^4.0 drupal/migrate_tools:^4.0
# You might need to downgrade to drush 8 if you are using drush 9
$ composer require drush/drush:^8.0 
```
- Create a new `yum_source` database
```
$ drush sqlq "CREATE DATABASE yum_source;" 
```
- Define this database in your settings.php:
```
$databases['yum_source']['default'] = array (
  'database' => 'yum_source',
  'username' => 'root',
  'password' => '',
  'host' => 'database',
  'port' => '3306',
  'driver' => 'mysql',
  'prefix' => '',
  'collation' => 'utf8mb4_general_ci',
);
```
- Import the sql/yum_source.sql file into this new database.
```
$ drush sqlq --database=yum_source --file=web/modules/custom/yum_migrate/sql/yum_source.sql
```
- Enable the module with `drush en yum_migrate -y`
- If you make changes to any of the yml files, re-import the config:
```
$ drush config-import -y --partial --source=modules/custom/yum_migrate/config/install
```

### Learning Migrate

Migrate Plus ships with a Migrate Example and a Migrate Example Advanced module.
To start with, you should read the README.txt in Migrate Example, making special
note of the order in which it tells you to read through it's files, as the
documentation verbosity decreases as you progress through that order.

#### Migrate concepts

There are 3 "stages" of migration. There is the Source (extract) stage, Process
(transform) stage, and Destination (load) stage. You will notice these concepts
in the yaml. For example, the `beer_node` migration in Migrate Example has the
following:

```$xslt
source:
  plugin: beer_node
destination:
  plugin: entity:node
process:
  # Hardcode the destination node type (bundle) as 'migrate_example_beer'.
  type:
    plugin: default_value
    default_value: migrate_example_beer
  title: name
  nid: bid
```

The Source plugin defines how the source data is extracted. The Destination
plugin defines what the destination data is going in Drupal. And the Process
plugin does the work of gluing those together with mappings, normalizers,
extractors, iterators and the like. It's a powerful system.

#### Paragraphs

For learning Paragraphs migration, we found [this blog post](https://deninet.com/blog/2017/06/18/building-custom-migration-drupal-8-part-5-paragraphs)
helpful.

#### Other resources

Here are some other resources for learning Migrate.

The following was adapted from https://drupalize.me/topic/import-data-migrate-api

- [Migrate API guide](https://www.drupal.org/docs/8/api/migrate-api) (drupal.org), and [Migration API documentation](https://api.drupal.org/api/drupal/core%21modules%21migrate%21migrate.api.php/group/migration/8.2.x) (api.drupal.org)
  - Drupal.org contains documentation about concepts, while api.drupal.org
  contains implementation details. Use this to locate documentation about the
  code that makes up the Migrate API, as well as examples of how to configure
  and use common destination and process plugins.
- [Migrate Plus module](https://www.drupal.org/project/migrate_plus) (drupal.org)
  - The Migrate Plus module contains some essential additional tools for working
  with migrations, many of which will likely be included in core in future
  versions. It also contains two carefully documented submodules that provide
  examples of implementing migrations in code. Use this for the additional
  enhancements and if you like to learn by reading through example code.
- [Drupal 8 Migrations by Example](http://2017.tcdrupal.org/session/drupal-8-migrations-example) (2017.tcdrupal.org)
  - Presentation covering the concepts and terminology of the migrate system
  followed by some examples including populating address, date, image, and file
  fields. Watch this presentation to get an overview of concepts used by the
  system, and get some insight into how two developers have used the migrate API
  on various real-world projects.
- Join the #migration channel on [Slack](http://drupal.org/slack) or the #drupal-migrate channel on [IRC](https://www.drupal.org/irc).


