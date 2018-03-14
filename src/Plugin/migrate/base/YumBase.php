<?php

namespace Drupal\yum_migrate\Plugin\migrate\base;

use Drupal\migrate\Plugin\migrate\source\SqlBase;

/**
 * Typically, it's a good idea to have a base migration class on a large
 * migration. That way, once you recognize areas where code duplication is
 * occurring, you can move that shared code to the base source migration class.
 */
abstract class YumBase extends SqlBase {}
