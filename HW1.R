#1

#How many of these bonds were approved by voters, and how many were defeated?
count(HW1, Result) #shows quantity of bonds approved and defeated

#Are there any differences in the rates of approved bonds across the four different government types?
table(HW1$Type, HW1$Result) #shows quantity of bonds approved and defeated by different government types

#2

#Calculate a new variable in the dataframe called “Votes_Total” that is the sum of the votes “for” and “against” the bond measure.
total <- HW1$VotesFor + HW1$VotesAgainst #sums total votes for each bond measure
HW1$Votes_Total <- total #adds variable to dataframe

#When and where did the bond measure with the highest voter turnout occur? What was it for?
max(total) #value is 1030414
maxvote <- HW1[HW1$Votes_Total == 1030414,] #crude way to isolate most voted-on bond
head(maxvote) #find other information about the bond
#from looking at the table, when: 11/8/22 & where: Harris & purpose: Other (Road Utilities)

#3

#Create a subset of this dataset that contains the bond measures that were approved and had at least 100 total votes.
votes100 <- HW1[HW1$Votes_Total >= 100 & HW1$Result == "Carried",] #creates subset of approved bond proposals with more than 100 votes

#Next, create a new variable within the subset dataframe that gives the percentage of total votes that were for the bond measure
forprop <- votes100$VotesFor/votes100$Votes_Total #finds proportion of votes for each bond measure
votes100$ProportionFor <- forprop #adds variable to dataframe

#and make a graph of the distribution of this new variable.
hist(votes100$ProportionFor,main='Histogram of Proportion of Votes For Bond Measures',
     xlab = "Proportion of Votes For Bonds", ylab = "Number of Bonds", col = "BLUE")
#creates graph of number of bonds for proportion of votes for bond measures

#4

#Is the margin a bond was approved by related to its cost? Use your subset from #3 to create a graph to display this relationship.

diff <- votes100$VotesFor - votes100$VotesAgainst #finds difference in votes for and votes against for each bond measure
votes100$Margin <- diff #adds variable to dataframe
plot(votes100$Margin, votes100$Amount, main = "Bond Voting Margins vs Bond Costs",
     xlab = "Vote Margin", ylab = "Bond Cost", pch = 20) #creates graph of bond margins (population )vs bond costs

# My favorite number is between -infinity and infinity


hi

