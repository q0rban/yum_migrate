<?php

namespace Drupal\yum_migrate\Plugin\migrate\source;

use Drupal\yum_migrate\Plugin\migrate\base\YumBase;
use Drupal\migrate\Row;

/**
 * Source plugin for Standard node content.
 *
 * This below is the annotation that lets migrate know that when you specify
 * plugin: node_standard in the yml, to use the NodeStandard class:
 *
 * @MigrateSource(
 *   id = "node_standard"
 * )
 */
class NodeStandard extends YumBase {

  /**
   * {@inheritdoc}
   */
  public function query() {
    /**
     * An important point to note is that your query *must* return a single row
     * for each item to be imported. Here we might be tempted to add a join to
     * standard_body in our query. Doing this would cause the query to return
     * multiple rows for a given node, once per related value, thus processing
     * the same node multiple times, each time with only one of the multiple
     * values that should be imported. To avoid that, we simply query the base
     * node data here, and pull in the relationships in prepareRow() below.
     */
    $query = $this->select('standard', 's')
                 ->fields('s', ['id', 'title', 'langcode']);

    $query->condition('type', 'standard');
    return $query;
  }

  /**
   * {@inheritdoc}
   */
  public function fields() {
    $fields = [
      'id' => $this->t('The unique numeric ID of the item.'),
      'title' => $this->t('The title of the Standard item.'),
      'langcode' => $this->t('The language of the Standard item.'),
      'body' => $this->t('The body of the Standard item.'),
    ];

    return $fields;
  }

  /**
   * {@inheritdoc}
   */
  public function getIds() {
    return [
      // 'id' is the name of the column in the source data that contains the
      // unique identifier for this source row. You *can* have multiple columns,
      // but that will complicate things. Note that the alias specified here
      // correlates with the alias you specified in the query above.
      'id' => [
        'type' => 'integer',
        'alias' => 's',
      ]
    ];
  }

  /**
   * {@inheritdoc}
   */
  public function prepareRow(Row $row) {
    /**
     * ::prepareRow() can be used to modify source data after it has been
     * selected from the database but before it is mapped to the destination
     * object. If you want to skip a row, you can return FALSE, or throw
     * MigrateSkipRowException().
     */
    if ($return = parent::prepareRow($row)) {
      // Populate the body on the source row from the standard_body table. We
      // don't do this in ->query(), because it's a one to many relationship
      // that would create problems in migration.
      $query = $this->select('standard_body', 'sb');
      $query->addField('sb', 'standard_item_id');
      $query->condition('sb.standard_id', $row->getSourceProperty('id'));
      $query->orderBy('sb.delta', 'ASC');
      if ($body_items = $query->execute()->fetchAll()) {
        $row->setSourceProperty('body', $body_items);
      }
    }
    return $return;
  }

}
