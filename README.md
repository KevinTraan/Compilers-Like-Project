#cisc458r

Compiler group project for "Like" language 

We added subdirectories to the /testSuite directory to organize the test
files by phase, and then by topic being tested. with a corresponding script
to automatically generate all the ssltrace outputs. The runTests.sh (for phase 1),
runTests2.sh (for phase 2), and runTests3.sh (for phase 3) scripts should be run 
while in the /testSuite directory with the command: ./runTestsX.sh

There are multiple flags that can be used when running runTests3.sh:
  - "./runTests3.sh i" will run the ssltrace command with the -ei flag
  - "./runTests3.sh g" will egrep the ssltrace output
  - "./runTests3.sh d" will delete all of the *.eOutput files recursively within the phase3 directory
  - "./runTests3.sh" (no flag) will run the ssltrace command with the -e flag

There are multiple flags that can be used when running runTests4.sh:
  - "./runTests4.sh i" will run the ssltrace command with the -ei flag
  - "./runTests4.sh e" will run the ptc command
  - "./runTests4.sh s" will run the `ptc -S` command
  - "./runTests4.sh d" will delete all of the *.eOutput, *.out, and *.s files recursively within the phase4 directory
  - "./runTests4.sh" (no flag) will run the ssltrace command with the -e flag