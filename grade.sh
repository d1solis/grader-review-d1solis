CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f "student-submission/ListExamples.java" ]]
then 
    echo "ListExamples.java found"
else
    echo "Need file ListExamples.java"
    exit 1
fi
cp -r lib student-submission
cp TestListExamples.java student-submission
cd student-submission

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" ListExamples.java TestListExamples.java

if [[ $? = 0 ]]
then 
    echo "Compilation successful"
else 
    echo "Compilation failed"
    exit 1
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > results.txt

if [[ $? = 0 ]]
then 
    echo "This submission passed!"
else
    echo "This submission failed!"
    exit 1
fi 