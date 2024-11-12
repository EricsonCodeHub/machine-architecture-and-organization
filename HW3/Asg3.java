

/**
 * Ericson Demo
 * Assignment 3
 * 
 * The Asg3 class simulates the addition of the number 200 to three variables 
 * of different types (byte, short, and int) and writes their values to a file 
 * every 10th iteration.
*/

// imports n eeded for program
import java.io.FileWriter;
import java.io.IOException;

public class Asg3
{

    /**
     * The main method is the entry point of the program. It writes
     * the values of byte, short, and int variables to a file after
     * incrementing them by 200 in each iteration, and outputs their 
     * values every 10th iteration.
     *
     * @param args 
     */
    public static void main(String[] args)
    {
        // String for file name
        String fileName = "outPut.txt";

        // try block will close file automaticaly when finished
       try (FileWriter file = new FileWriter(fileName))
       {
            // Initialize variables of different types.
            byte valueB = 0;
            short valueS = 0;
            int vlaueI = 0;

            // Writing header information to the file.
            file.write("Name: Ericson Demo");
            file.write("\n");
            file.write("Assignment: 3");
            file.write("\n\n");

            // Loop to add 200 to each variable 500 times.
            for(int i = 0 , j = 0; i < 500 ; i++ , j++ )
            {
                // Increment the variables by 200 in each iteration.
                valueB += 200;
                valueS += 200;
                vlaueI += 200;

                // Every 10th iteration, write the current values to the file.
                if(j == 9)
                {
                    file.write("byte: " + valueB + " short: " + valueS + " int: " + vlaueI + "\n\n");
                    // Reset 'j' to -1 so it becomes 0 on the next loop.
                    j = -1;
                }
            }
        // Catch and print the exception 
        } catch (IOException e)
        {
            
            System.out.println("File problem occurred.");
        }
    }
}