<?php
namespace Ionize;

class Parser
{
	private $ionize_pattern = '/<(|\/)ion:([a-z:]+)?([^>]*)?>/im';

	private $tags = array();
	private $parents = array();
	private $level = 0;

	private $compile = array();

	/**
	 * Parsing view content
	 *
	 * @param string $source
	 *
	 * @return mixed
	 */
	public function parse($source)
	{
		$this->resetParser();

		preg_match_all($this->ionize_pattern, $source, $matches);
		Debug($matches, '$matches');

		require_once("Tag.php");

		foreach ($matches[0] as $index => $src)
		{
			$sourceCompiled = FALSE;
			Debug($src, '$source');

			// If the tag is a closing tag then close the parent
			if (strpos($src, '</') !== FALSE)
			{
				$parent = $this->getParent();

				if ($parent != NULL)
				{
					$this->compile[] = [$src=>$parent->getNativeCodeClosing()];
					$sourceCompiled = TRUE;
				}

				$this->closeParent();
			}

			// Creating the tag from the source
			if($sourceCompiled == FALSE)
			{
				$parent = $this->getParent();
				//Debug($parent, '$parent');

				$tag = new Tag($src, $parent);
				//Debug($tag, '$tag');

				$this->compile[] = [$src=>$tag->getNativeCodeOpening()];

				$this->tags[] = $tag;
				$this->openParent();
			}

			// If the tag closed in one line then close the parent
			if (strpos($src, '/>') !== FALSE)
			{
				$parent = $this->getParent();

				if ($parent != NULL)
				{
					$closingCode = $parent->getNativeCodeClosing();

					if(!empty($closingCode))
						$this->compile[] = [$src=>$closingCode];
				}

				$this->closeParent();
			}
		}

		Debug('Compiler contents:');

		$parsed = $source;
		foreach($this->compile as $index => $task)
		{
			$sourceCode = key($task); Debug($sourceCode, '$sourceCode');
			$nativeCode = $task[$sourceCode]; Debug($nativeCode, '$nativeCode');

			$preg_search = '/'.preg_quote($sourceCode, '/').'/im';
			Debug($preg_search, '$preg_search');

			$parsed = preg_replace($preg_search, $nativeCode, $parsed, 1);
		}

		//$parsed = str_replace(array_keys($this->compile), array_values($this->compile), $source);
		Debug($parsed, '$parsed');

		return $parsed;
	}

	private function resetParser()
	{
		$this->tags = array();
		$this->parents = array();
		$this->compile = array();
		$this->level = 0;
	}

	/**
	 * Getting the actual parent element
	 *
	 * @return mixed|null
	 */
	private function getParent()
	{
		//Debug($this->parents, '$this->parents');
		//Debug($this->level, '$this->level');

		$level = $this->level-1;

		// Determining the parent element
		if (isset($this->parents[$level])) $parent = $this->parents[$level];
		else $parent = NULL;

		return $parent;
	}

	/**
	 * Opening a parent level
	 *
	 * @return $this
	 */
	private function openParent()
	{
		//Debug($this->level, 'openParent on level');

		$this->parents[$this->level] = end($this->tags);
		$this->level++;

		return $this;
	}

	/**
	 * Closing a parent level and deleting the junk
	 *
	 * @return $this
	 */
	private function closeParent()
	{
		//Debug($this->level, 'closeParent on level');

		if(isset($this->parents[($this->level-1)]))
		{
			unset($this->parents[$this->level]);
			$this->level--;
		}

		return $this;
	}
}