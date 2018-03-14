<?php

namespace Drupal\yum_migrate\Plugin\migrate\base;

/**
 * There are likely going to be separate migrations for each paragraph type,
 * e.g. text, url, image, heading, listings, etc. By having an abstract class
 * for the Paragraph migrations to extend, you can share much of the code to
 * migrate these different types.
 */
abstract class ParagraphsBase extends YumBase {}
