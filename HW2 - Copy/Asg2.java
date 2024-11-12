/**
 * 
 *  Ericson Demo
 *  Assignment 2
 *  This program demonstarates the rounding errors
 *  using doubles and floats
 * 
*/
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
public class Asg2 
{

    /**
     * The entry point of the program.
     *
     * @param args Command-line arguments 
     */
    public static void main(String[] args)
    {
        
        // calls doMath meathod
        doMath();
        
    }


    /**
     * Performs mathematical calculations using both double and float precision and writes the results to a file.
     * 
     */
    public static void doMath()
    {

        // file print set up
        String fileName = "outPutFile.txt";

        // used for print fromating, i dont like scientific notation
        DecimalFormat df = new DecimalFormat("0.########");

        try(FileWriter file = new FileWriter(fileName);)
        {

            // data header
            file.write("Name: Ericson Demo");
            file.write("\n");
            file.write("Assignment 2");
            file.write("\n\n\n");
            file.write("doubles start here///////////////////////////////////////////////////////////\n");

            // this increases the iterations 10X per loop 
            for(int iterations = 1000; iterations< 1000000001; iterations *= 10)
            {
                // accumulator variables
                double halfSumDouble = 0.0;
                double thirdSumDouble = 0.0;
                double halfProductDouble;
                double thirdProductDouble;

                // loops till i = iterations
                for (int  i = 0; i < iterations; i++)
                {
                    halfSumDouble += 1.0 / 2.0;
                    thirdSumDouble += 1.0 / 3.0;
                }

                halfProductDouble = (1.0 / 2.0) * iterations;
                thirdProductDouble = (1.0 / 3.0) * iterations;

                // Write results for doubles to the file
                file.write("For " + iterations + " iterations:\n");
                file.write("  One half addition (double): " + df.format(halfSumDouble) + "\n");
                file.write("  One half multiplication (double): " + df.format(halfProductDouble) + "\n");
                //Math.abs is used to avoid negitive numbers
                file.write("  The difference (double): " + df.format(Math.abs(halfSumDouble - halfProductDouble)) + "\n");
                file.write("  One third addition (double): " + df.format(thirdSumDouble) + "\n");
                file.write("  One third multiplication (double): " + df.format(thirdProductDouble) + "\n");
                file.write("  The difference (double): " + df.format(Math.abs(thirdSumDouble - thirdProductDouble)) + "\n\n");

            }

            // Separate section for floats
            file.write("floats start here///////////////////////////////////////////////////////////\n");


            for (int iterations = 1000; iterations < 1000000001; iterations *= 10)
            {
                // accumulator variables
                float halfSumFloat = 0.0f;
                float thirdSumFloat = 0.0f;
                float halfProductFloat;
                float thirdProductFloat;

                // loops till i = iterations
                for (int i = 0; i < iterations; i++) {
                    halfSumFloat += 1.0f / 2.0f;
                    thirdSumFloat += 1.0f / 3.0f;
                }

                halfProductFloat = (1.0f / 2.0f) * iterations;
                thirdProductFloat = (1.0f / 3.0f) * iterations;


                // Write results for floats to the file
                file.write("For " + iterations + " iterations:\n");
                file.write("  One half addition (float): " + df.format(halfSumFloat) + "\n");
                file.write("  One half multiplication (float): " + df.format(halfProductFloat) + "\n");
                //Math.abs is used to avoid negitive numbers
                file.write("  The difference (float): " + df.format(Math.abs(halfSumFloat - halfProductFloat)) + "\n");
                file.write("  One third addition (float): " + df.format(thirdSumFloat) + "\n");
                file.write("  One third multiplication (float): " + df.format(thirdProductFloat) + "\n");
                file.write("  The difference (float): " + df.format(Math.abs(thirdSumFloat - thirdProductFloat)) + "\n\n");
            }
        }
        catch(IOException e)
        {
            System.out.println("file problem");
        }
    }   
}
