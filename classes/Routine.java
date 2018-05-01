class Routine 
{
	private static routines_count=0;
	private int routine_id;
	private string name;
	private List<Activity> activities; //how to put the activities in the right order ? they will be put in order before hand in the UI. but it should be modifiable
	
	//constructors
	Routine(string name)
	{
		this.routine_id = ++routines_count;
		this.name = name;
	}
	
	Routine(string name, List<Activity> activities)
	{
		this.routine_id = ++routines_count;
		this.name = name;
		this.activities = activities;
	}
	
	//properties
	int Routine_id
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
	
	void AddActivity(Activity newAct)
	{
		this.activities.add(newAct);
	}
	
	void AddAllActivities(List<Activity> activities)
	{
		this.activities = activities;
	}
	
	void SwitchOrder(Activity a, Activity b) //modifies the order of 2 activities in the routine --> through an SQL query ??
	{
		
	}
		
}