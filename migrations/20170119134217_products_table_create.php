<?php


use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;


class ProductsTableCreate extends AbstractMigration
{


	/**
	 * Migrate Up.
	 */
	public function up()
	{
		if( ! $this->hasTable( 'products' ) )
		{
			$this->table( 'products' )
				->addColumn('title', 'string', ['limit' => 100])
				->addColumn('description', 'string', ['limit' => 250])
				->addColumn('price', 'decimal', ['precision' => 10, 'scale' => 2, 'signed' => false])
				->create();

			$this->execute('
				INSERT INTO `products` (`title`, `description`, `price`) VALUES 
				("Used socks", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tema aliqua.", "10.5"),
				("Socks with hole", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, see et dolore magna aliqua.", "12.5"),
				("Socks with two holes", "Lorem ipsum dolor sit amet, consectetur aabore et dolore magna aliqua.", "15.5"),
				("New socks", "Lorem ipsum dolor sit amet, consectetuiusmod tempor incidid et dolore magna aliqua.", "5.25"),
				("One sock", "Lorem ipsum dolor sit amet, conit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "3.5"),
				("One used sock", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "5.55"),
				("One sock with hole", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inc ut labore et dolore magna aliqua.", "6.35"),
				("One sock with two holes", "Lorem ipsum dolor sit amet,o eiusmod tempor incididunt ut labore et dolore magna aliqua.", "7.8"),
				("Black cap", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "8.8"),
				("Red cap", "Lorem ipsum dolor sit amet, consectetur adipiempor incididunt ut labore et dolore magna aliqua.", "8.8"),
				("Blue cap", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusme et dolore magna aliqua.", "8.8"),
				("Gray cap", "Lomet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "9.8"),
				("Pink cap", "Lorem ipsudipiscing elit, sedolore magna aliqua.", "7.85"),
				("Brown cap", "Lorem ipsum dolor sit amet, consectetur adipisciunt ut labore et dolore magna aliqua.", "9.9"),
				("Gray cap", "Lorem ipsuectetur adipiscing elit, sed do eiusmod te dolore magna aliqua.", "11.8"),
				("Green cap", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "4.8"),
				("Yellow cap", "Loremsit amet, consectetur adipiscing elit, sed do eiusmolore magna aliqua.", "6.3"),
				("Orange cap", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut la aliqua.", "8.85");
			');
		}
	}


	/**
	 * Migrate Down.
	 */
	public function down()
	{

	}

}