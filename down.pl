my (@arg) = @ARGV;
#perl script to scrape the slides from browser all at once
if (!@arg){
	print "USAGE: \n 
	   First arg : SEMISTER Number
	   Second Arg: Semister Subject 
	   Third arg : UNIT Number
	   Fourth Arg : Number of Pages
	   IMAGE TYPE : JPG or PNG  
	   Example: perl $0 3 DIF233 UNIT2 49 jpg\n";
     exit;	
}else{
	#print "$arg[0]==$arg[1] === $arg[2]==$arg[3]\n";
	system("mkdir -p $arg[1]/$arg[2]"); #creates directory where you want to store the slides
	system("cd  $arg[1]/$arg[2];"); #path to that directory
	
	#my $val="(?:jpg|png)";
	my $val = $arg[3]; 
	  for(my $i=0;$i<=$val;$i++){ #from 0 to the number of slides the ppt has
	
	 my $val1= "wget http://media.msconline.au-kbc.org.in/slides/semester$arg[0]/$arg[1]/$arg[2]/slides/complete/img$i.jpg"; #scrapes the slides from browser
	  my $val2= "convert img$i.jpg slide.pdf"; #converts all slides to one pdf
	 my $val3= "mv slide.pdf '$arg[1]/$arg[2]/'"; #moves the pdf to the directory created
	  system("$val1");
	 system("$val2");
	  system("$val3");
	}
	for(my $i=0;$i<=$val;$i++){
		$c = `pwd`; #the directory is from your present working directory
		chomp($c);
		$aa = "$c/$arg[1]/$arg[2]/";
		
		#print "cp img$i.png $aa\n";
	system ("mv img$i.jpg  $aa"); #moves the slides to the directory created

	}

#http://media.msconline.au-kbc.org.in/slides/semester3/DIF233/unit1/slides/complete/img{0..63}.png
#http://media.msconline.au-kbc.org.in/slides/semester3/DIF233/combined/img0.jpg	
#http://media.msconline.au-kbc.org.in/slides/semester3/DIF232/unit2/slides/complete/img8.html
#http://media.msconline.au-kbc.org.in/slides/semester3/DIF232/unit2/slides/complete/img8.png
#run as perl down.pl 4 DIF%20004 unit1 63
}
