component  output="false"
{

	public  function init()
	{
		return this;
	}

	public any function methodLogger(String propname='Henry')
	 output="false"
	{
		arguments.propname = "Fred";
		
		return arguments.propname;
	}

	public void function onDIComplete()
	{

	}

}