<?php

namespace Drupal\yum_migrate\Plugin\migrate\source;

use Drupal\yum_migrate\Plugin\migrate\base\ParagraphsBase;
use Drupal\migrate\Row;

/**
 * Source plugin for text content that will get migrated into Paragraphs of type
 * 'text'.
 *
 * This below is the annotation that lets migrate know that when you specify
 * plugin: paragraph_text in the yml, to use this class:
 *
 * @MigrateSource(
 *   id = "paragraph_text"
 * )
 */
class ParagraphText extends ParagraphsBase {

  /**
   * {@inheritdoc}
   */
  public function query() {
    /**
     * An important point to note is that your query *must* return a single row
     * for each item to be imported. That means that if this paragraph item has
     * a one to many relationship with another piece of data, you either need to
     * use GROUP_CONCAT to join to that data, or pull that data in in the
     * prepareRow() method.
     */
    $query = $this->select('standard_item', 'si')
      ->fields('si', ['id', 'type']);
    $query->leftJoin('standard_item_text', 'sit', 'si.id = sit.id');
    $query->addField('sit', 'value');
    $query->condition('si.type', 'text');
    return $query;
  }

  /**
   * {@inheritdoc}
   */
  public function fields() {
    $fields = [
      'id' => $this->t('The unique numeric ID of the item.'),
      'type' => $this->t('The type of the Standard item.'),
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
        'alias' => 'si',
      ],
    ];
  }

  /**
   * {@inheritdoc}
   */
//  public function prepareRow(Row $row) {
//    /**
//     * ::prepareRow() can be used to modify source data after it has been
//     * selected from the database but before it is mapped to the destination
//     * object. If you want to skip a row, you can return FALSE, or throw
//     * MigrateSkipRowException().
//     */
//    return parent::prepareRow($row);
//  }

}
