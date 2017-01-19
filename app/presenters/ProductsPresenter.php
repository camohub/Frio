<?php

namespace App\Presenters;

use Nette;
use Tracy\Debugger;


class ProductsPresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context */
	private $database;

	/** @param $cartSession */
	private $cartSession;


	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}


	public function startup()
	{
		parent::startup();
		$this->cartSession = $this->getSession('cart');
		$this->cartSession->products = $this->cartSession->products ?: [];
	}


	public function actionAddToCart($id)
	{
		if (array_key_exists($id, $this->cartSession->products)) {
			$this->cartSession->products[$id] = ++$this->cartSession->products[$id];
		} else {
			$this->cartSession->products[$id] = 1;
		}
		$this->flashMessage('Product has been added to cart.', 'success');
		$this->redirect('Products:cart');
	}


	public function actionRemoveOneFromCart($id)
	{
		if (array_key_exists($id, $this->cartSession->products) && $this->cartSession->products[$id] > 1) {
			$this->cartSession->products[$id] = --$this->cartSession->products[$id];
		} else {
			unset($this->cartSession->products[$id]);
		}
		$this->flashMessage('Products count have been decreased in cart.', 'success');
		$this->redirect('Products:cart');
	}


	public function actionRemoveFromCart($id)
	{
		unset($this->cartSession->products[$id]);
		$this->flashMessage('Product has been removed from cart.', 'success');
		$this->redirect('Products:cart');
	}


	public function renderDefault($page = 1)
	{
		$this->template->page = $page;
		$this->template->products = $this->database->table('products')
			->order('id DESC')
			->page($page, 6);
	}


	public function renderDetail($id)
	{
		if (!$product = $this->database->table('products')->get($id)) {
			$this->flashMessage('Product was not found.', 'error');
			$this->redirect('Products:default');
		}

		$this->template->products = $product;
	}



	public function renderCart()
	{
		$cartProducts = $this->cartSession->products;
		$this->template->products = $cartProducts ? $this->database->table('products')->where(['id' => array_keys($cartProducts)])->fetchAll() : [];
		$this->template->cart = $this->cartSession->products;
	}

}
