<?php

namespace Traits\Ionize;

trait Tag
{
	private $output = FALSE;
	private $items = array();
	private $attributes = NULL;
	private $parent = NULL;
	private $data = NULL;

	public function attr( $attributes )
	{
		$this->attributes = json_decode($attributes);
	}

	public function getOutput()
	{
		Debug($this->output, get_class().'->getOutput()');
		return $this->output;
	}

	public function getItems()
	{
		Debug($this->items, get_class().'->getItems()');
		return $this->items;
	}

	private function addItem($item)
	{
		$this->items[] = $item;
		return $this;
	}

	public function item($name, $attributes)
	{
		Debug($this->data->$name, get_class().'->item()');
		return $this->data->$name;
	}
}