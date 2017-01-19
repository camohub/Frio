<?php


use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;


class UserColToPostsTable extends AbstractMigration
{


	/**
	 * Migrate Up.
	 */
	public function up()
	{
		$posts = $this->table( 'posts' );

		if( ! $posts->hasColumn( 'user' ) )
		{
			$posts->addColumn( 'user', 'string', ['limit' => 50, 'default' => 'admin'] )->save();
		}
	}


	/**
	 * Migrate Down.
	 */
	public function down()
	{

	}

}