class Activity 
{
	private static activities_count=0;
	private int activity_id;
	private string name;
	private string description,
	private int user_id; //creator of the activity
	
	//constructors
	Activity(string name)
	{
		this.activity_id = ++activities_count;
		this.name = name;
	}
	
	Activity(string name, string description)
	{
		this.activity_id = ++activities_count;
		this.name = name;
		this.description = description;
	}
	
	//properties
	int Activity_id
	{
		get {return this.routine_id;}
		set {this.routine_id = value;}
	}
	
	string Name 
	{
		get {return this.name;}
		set {this.name = value;}
	}
	
	//methods
	void DisplayTip() //displays a tip according to the nature of the activity
	{
	}
		
}