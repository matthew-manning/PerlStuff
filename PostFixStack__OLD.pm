package PostFixStack__OLD;
+
+sub stack
+{
+	my $Invoc = shift;
+	my $Class = ref($Invoc)||$Invoc;
+	return bless([], $Class);
+}
+
+sub printStack
+{
+	$Stack = shift;
+		
+	print "\n";
+	for($i = 10; $i > 0; $i--)
+	{
+		$Val = $Stack[$i-1]||" ";#default to single space 
+		print "$i:\t".$Val."\n";
+	}
+	print "\n";
+}
+
+
+sub delete
+{
+	my $Stack = shift;
+	my $Check = pop $Stack;
+	
+	print "stack is empty\n" unless $check;
+}
+
+sub swap#swaps bottom two items
+{
+	my $Stack = shift;
+	if($Stack[0]&&$Stack[1])#check both exist
+	{
+		($Stack[0], $Stack[1]) = ($Stack[1], $Stack[0]);
+	}
+	else
+	{
+	print "not enough items\n";
+	}
+}
+sub add#adds items to stack
+{
+	$Stack = $_[0];
+	@Passed = split(" ", $_[1]);#passed as "3 10 5 99 etc", pushed LHS->RHS
+	for $Val (@Passed)
+	{
+		push(@Stack, $Val);
+	}
+}
+
+sub plus
+{
+	my $Stack = shift;
+	my $Val1 = shift(@Stack);
+	my $Val2 = shift(@Stack);
+	
+	if($Val1&&$Val2)#check both exist
+	{
+		unshift(@Stack, $Val1 + $Val2);
+	}
+	else
+	{
+	print "not enough items\n";
+	}
+}
+
+sub minus
+{
+	my $Stack = shift;
+	my $Val1 = shift(@Stack);
+	my $Val2 = shift(@Stack);
+	
+	if($Val1&&$Val2)#check both exist
+	{
+		unshift(@Stack, $Val2-$Val1);
+	}
+	else
+	{
+	print "not enough items\n";
+	}
+}
+
+sub times
+{
+	my $Stack = shift;
+	my $Val1 = shift(@Stack);
+	my $Val2 = shift(@Stack);
+	
+	if($Val1&&$Val2)#check both exist
+	{
+		unshift(@Stack, $Val2*$Val1);
+	}
+	else
+	{
+	print "not enough items\n";
+	}
+}
+
+sub divide
+{
+	my $Stack = shift;
+	my $Val1 = shift(@Stack);
+	my $Val2 = shift(@Stack);
+	
+	if($Val1&&$Val2)#check both exist
+	{
+		unshift(@Stack, $Val2/$Val1);
+	}
+	else
+	{
+	print "not enough items\n";
+	}
+}
+
+
+return 1;
