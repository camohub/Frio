<?php

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;


class SignPresenter extends Nette\Application\UI\Presenter
{

	/**
	 * Sign-in form factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentSignInForm()
	{
		$form = new Form;

		$form->addText('username', 'Username:')
			->setAttribute('class', 'form-control')
			->setRequired('Please enter your username.');

		$form->addPassword('password', 'Password:')
			->setAttribute('class', 'form-control')
			->setRequired('Please enter your password.');

		$form->addSubmit('send', 'Sign in')
			->setAttribute('class', 'btn btn-primary');

		// call method signInFormSucceeded() on success
		$form->onSuccess[] = [$this, 'signInFormSucceeded'];

		return $form;
	}


	public function signInFormSucceeded($form, $values)
	{
		try {
			$this->getUser()->login($values->username, $values->password);
			$this->flashMessage('You have been logged in.', 'success');
			$this->redirect('Homepage:');

		} catch (Nette\Security\AuthenticationException $e) {
			$form->addError('Incorrect username or password.');
		}
	}


	public function actionOut()
	{
		$this->getUser()->logout();
		$this->flashMessage('You have been signed out.', 'success');
		$this->redirect('Homepage:');
	}

}
