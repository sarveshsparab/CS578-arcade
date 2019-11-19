if [ -z "$1" ]
	then
	echo "Application's name is missing (#1)"
	exit 0
fi
if [ -z "$2" ]
	then
	echo "recoveryMethodName is missing (#2)"
	exit 0
fi


application="$1"
recoveryMethodName="$2"
analysisName="STIC"

arcadeFolder="/Users/pooyan/git/arcade"
workingFolder="$arcadeFolder/pooyan"
recoverResultFolder="$workingFolder/$recoveryMethodName/$application"

objFile="$arcadeFolder/pooyan/JCPIS/$application/issues/version2issuecountmap.obj"

AnalyseApplicationFolder="$workingFolder/$analysisName/$application/$recoveryMethodName"
rm -r $AnalyseApplicationFolder
mkdir -p $AnalyseApplicationFolder

resultFile="$AnalyseApplicationFolder/$application-$recoveryMethodName-$analysisName.out"
rootLogSrc="$arcadeFolder/logs/root.log"
rootLogDst="$AnalyseApplicationFolder/$application-$recoveryMethodName-$analysisName.log"

fE1="ser"
smellSerFilesCollection="$AnalyseApplicationFolder/smellSer"
mkdir $smellSerFilesCollection
rm $smellSerFilesCollection/*
./script_fileCollector.sh $fE1 $recoverResultFolder $smellSerFilesCollection

/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/bin/java -Dfile.encoding=US-ASCII -classpath /Users/pooyan/git/arcade/bin:/Users/pooyan/git/arcade/libs/weka.jar:/Users/pooyan/git/arcade/libs/jxl.jar:/Users/pooyan/git/arcade/libs/log4j-1.2.16.jar:/Users/pooyan/git/arcade/libs/guava-10.0.1.jar:/Users/pooyan/git/arcade/libs/commons-cli-1.2.jar:/Users/pooyan/git/arcade/libs/sootclasses-2.4.0.jar:/Users/pooyan/git/arcade/libs/polyglotclasses-1.3.5.jar:/Users/pooyan/git/arcade/libs/jasminclasses-2.4.0.jar:/Users/pooyan/git/arcade/libs/mallet.jar:/Users/pooyan/git/arcade/libs/gexf4j-core-0.2.0-ALPHA.jar:/Users/pooyan/git/arcade/libs/Jama-1.0.2.jar:/Users/pooyan/git/arcade/libs/jgrapht-jdk1.6.jar:/Users/pooyan/git/arcade/libs/collections-generic-4.01.jar:/Users/pooyan/git/arcade/libs/colt-1.2.0.jar:/Users/pooyan/git/arcade/libs/vecmath-1.3.1.jar:/Users/pooyan/git/arcade/libs/j3d-core-1.3.1.jar:/Users/pooyan/git/arcade/libs/jung-api-2.0.1.jar:/Users/pooyan/git/arcade/libs/concurrent-1.3.4.jar:/Users/pooyan/git/arcade/libs/jung-algorithms-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-visualization-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-3d-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-graph-impl-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-3d-demos-2.0.1.jar:/Users/pooyan/git/arcade/libs/wstx-asl-3.2.6.jar:/Users/pooyan/git/arcade/libs/stax-api-1.0.1.jar:/Users/pooyan/git/arcade/libs/jung-io-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-jai-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-samples-2.0.1.jar:/Users/pooyan/git/arcade/libs/jung-jai-samples-2.0.1.jar:/Users/pooyan/git/arcade/libs/poi-3.8-20120326.jar:/Users/pooyan/git/arcade/libs/poi-ooxml-3.8-20120326.jar:/Users/pooyan/git/arcade/libs/xmlbeans-2.3.0.jar:/Users/pooyan/git/arcade/libs/dom4j-1.6.1.jar:/Users/pooyan/git/arcade/libs/junit-3.8.1.jar:/Users/pooyan/git/arcade/libs/poi-ooxml-schemas-3.8-20120326.jar:/Users/pooyan/git/arcade/libs/poi-excelant-3.8-20120326.jar:/Users/pooyan/git/arcade/libs/poi-examples-3.8-20120326.jar:/Users/pooyan/git/arcade/libs/poi-scratchpad-3.8-20120326.jar:/Users/pooyan/git/arcade/libs/commons-math3-3.0.jar:/Users/pooyan/git/arcade/libs/commons-lang3-3.1.jar:/Users/pooyan/git/arcade/libs/snowball.jar:/Users/pooyan/git/arcade/libs/xstream-1.4.6.jar:/Users/pooyan/git/arcade/libs/xstream/xmlpull-1.1.3.1.jar:/Users/pooyan/git/arcade/libs/xstream/xpp3_min-1.1.4c.jar:/Users/pooyan/git/arcade/libs/classcycle.jar:/Users/pooyan/git/arcade/libs/trove-2.0.2.jar:/Users/pooyan/git/arcade/libs/jira-client-0.5-SNAPSHOT-jar-with-dependencies.jar:/Users/pooyan/git/arcade/libs/svnkit-1.8.3.jar:/Users/pooyan/git/arcade/libs/jcommander-1.36-SNAPSHOT.jar:/Applications/eclipse/plugins/org.junit_4.10.0.v4_10_0_v20120426-0900/junit.jar:/Applications/eclipse/plugins/org.hamcrest.core_1.1.0.v20090501071000.jar:/Users/pooyan/git/arcade/libs/org.eclipse.core.contenttype_3.4.200.v20130326-1255.jar:/Users/pooyan/git/arcade/libs/org.eclipse.core.resources_3.8.101.v20130717-0806.jar:/Users/pooyan/git/arcade/libs/org.eclipse.core.runtime_3.9.0.v20130326-1255.jar:/Users/pooyan/git/arcade/libs/org.eclipse.jdt.core_3.9.1.v20130905-0837.jar:/Users/pooyan/git/arcade/libs/org.eclipse.osgi_3.9.1.v20130814-1242.jar:/Users/pooyan/git/arcade/libs/org.eclipse.equinox.common_3.6.200.v20130402-1505.jar:/Users/pooyan/git/arcade/libs/org.eclipse.equinox.preferences_3.5.100.v20130422-1538.jar:/Users/pooyan/git/arcade/libs/org.eclipse.core.jobs_3.5.300.v20130429-1813.jar edu.usc.softarch.arcade.antipattern.detection.SmellToIssuesCorrelation $smellSerFilesCollection $objFile > $resultFile
echo "results are saved at $resultFile"

cp  $rootLogSrc $rootLogDst
echo "log file is at $rootLogDst"
exit 0

