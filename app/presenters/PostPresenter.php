<?php

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Tracy\Debugger;


class PostPresenter extends Nette\Application\UI\Presenter
{

	/** @var Nette\Database\Context */
	private $database;


	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}


	public function renderShow($id)
	{
		$post = $this->database->table('posts')->get($id);
		if (!$post) {
			$this->error('Post not found');
		}

		$this->template->post = $post;
		$this->template->comments = $post->related('comment')->order('created_at');
	}


	public function actionCreate()
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}
	}


	public function actionEdit($id)
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}

		$post = $this->database->table('posts')->get($id);

		if ($this->getUser()->id !== $post->user) {
			$this->flashMessage('You have not permission to edit this post.', 'error');
			$this->redirect('Homepage:default');
		}

		if (!$post) {
			$this->error('Post not found');
		}

		$this['postForm']->setDefaults($post->toArray());
	}


	public function actionDelete($id)
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}

		$post = $this->database->table('posts')->get($id);

		if ($this->getUser()->id !== $post->user) {
			$this->flashMessage('You have not permission to delete this post.', 'error');
			$this->redirect('Homepage:default');
		}

		if (!$post) {
			$this->error('Post not found');
		}

		try
		{
			$this->database->beginTransaction();

			$this->database->table('comments')->where(['post_id' => $id])->delete();
			$this->database->table('posts')->where(['id' => $id])->delete();
			$this->flashMessage('Post was deleted.', 'success');

			$this->database->commit();
		}
		catch (\Exception $e)
		{
			$this->database->rollBack();
			Debugger::log($e->getMessage() . ' @in file ' . __FILE__ . ' on line ' . __LINE__, 'error');
			$this->flashMessage('Something went wrong. Try it again latter.', 'error');
			$this->redirect('Post:show', ['id' => $post->id]);
		}

		$this->redirect('Homepage:default');
	}


	protected function createComponentPostForm()
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->error('You need to log in to create or edit posts');
		}

		$form = new Form;

		$form->addProtection('Request is evaluated as unsecured.');

		$form->addText('title', 'Title:')
			->setAttribute('class', 'form-control')
			->setRequired('Title is required field.');

		$form->addTextArea('content', 'Content:')
			->setAttribute('class', 'form-control')
			->setRequired('Content is required field.');

		$form->addSubmit('send', 'Save and publish')
			->setAttribute('class', 'btn btn-primary');

		$form->onSuccess[] = [$this, 'postFormSucceeded'];

		return $form;
	}


	public function postFormSucceeded($form, $values)
	{
		$post_id = $this->getParameter('id');

		try
		{
			$this->database->beginTransaction();

			if ($post_id) {
				$post = $this->database->table('posts')->get($post_id);
				$post->update($values);
			} else {
				$data = $values;
				$data['user'] = $this->getUser()->id;
				$post = $this->database->table('posts')->insert($data);
			}
			$this->flashMessage('Post was published', 'success');

			$this->database->commit();
		}
		catch (\Exception $e)
		{
			$this->database->rollBack();
			Debugger::log($e->getMessage() . ' @in file ' . __FILE__ . ' on line ' . __LINE__, 'error');
			$this->flashMessage('Something went wrong while inserting data.', 'error');
			$this->redirect('Homepage:default');
		}

		$this->redirect('show', $post->id);
	}


	protected function createComponentCommentForm()
	{
		$form = new Form;

		$form->addProtection('Request is evaluated as unsecured.');

		$form->addText('name', 'Your name:')
			->setAttribute('class', 'form-control')
			->setRequired('Name is required field.');

		$form->addEmail('email', 'Email:')
			->setAttribute('class', 'form-control');

		$form->addTextArea('content', 'Comment:')
			->setAttribute('class', 'form-control')
			->setRequired('Content is required field.');

		$form->addSubmit('send', 'Publish comment')
			->setAttribute('class', 'btn btn-primary');

		$form->onSuccess[] = [$this, 'commentFormSucceeded'];

		return $form;
	}


	public function commentFormSucceeded($form, $values)
	{
		$this->database->table('comments')->insert([
			'post_id' => $this->getParameter('id'),
			'name' => $values->name,
			'email' => $values->email,
			'content' => $values->content,
		]);

		$this->flashMessage('Thank you for your comment', 'success');
		$this->redirect('this');
	}

}
