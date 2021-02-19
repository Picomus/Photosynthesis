
/*** Input to neural network ***/

//boardspaces - nothing/seed/small tree/mid tree/large tree (0.0, 0.25, 0.5, 0.75, 1.0)
//boardspaces - opponent id(color),                         (0.0, 0.333, 0.666, 1.0)
//gamephase (3x6)
//for each player (starting with self and then continuing according to who has next turn)
//---lightpoints (steps of 1/20)
//---no_of_seeds
//---no_of_small_trees
//---no_of_mid_tree
//---no_of_large_trees




/*** Output from neural network ***/
//buy seed - (higher no = higher priority)
//buy tree - (higher no = higher priority)
//plant seed - (higher no = higher priority)
//grow tree - (higher no = higher priority)
//tree size for buying - small/mid/large (0-0.333,0.333-0.666,0.666-1.0) 
//boardspaces - action here (higher no = higher priority)






class trainer
{
}



class neuralNetwork
{
  float[] weights;
  float[] biases;
  int[] neurons_per_hidden_layer;
  
  float[] neurons;
  
  int no_of_output;
  float[] output;
  
  
     float varians = 6.0;
  
     neuralNetwork(int no_of_input, int no_of_output, int[] neurons_per_hidden_layer)
     {                                            
        init(no_of_input, no_of_output, neurons_per_hidden_layer);
        init_weights_and_biases_randomly();                 
     }
    
     neuralNetwork(float[] weights, float[] biases, int no_of_input, int no_of_output, int[] neurons_per_hidden_layer)
     {        
        init(no_of_input, no_of_output, neurons_per_hidden_layer);
        init_weights_and_biases(weights, biases);
                     
     }
    
    void init(int no_of_input, int no_of_output, int[] neurons_per_hidden_layer)
    {       
        this.no_of_output = no_of_output;
      
        int no_of_weights = no_of_input*no_of_input;
        int no_of_biases = no_of_input + no_of_output;
        //int no_of_hidden_neurons = 0;
       
       
       int neurons_in_previous_layer = no_of_input;
        if(neurons_per_hidden_layer != null)
        {
           this.neurons_per_hidden_layer = new int[neurons_per_hidden_layer.length];        
           for(int i=0;i<neurons_per_hidden_layer.length;i++)
           {
              this.neurons_per_hidden_layer[i] = neurons_per_hidden_layer[i];
           }
           
           
            for(int i=0;i<neurons_per_hidden_layer.length;i++)
            {
               no_of_weights += neurons_per_hidden_layer[i]*neurons_in_previous_layer;
               no_of_biases += neurons_per_hidden_layer[i];
               //no_of_hidden_neurons += neurons_per_hidden_layer[i];
               
               neurons_in_previous_layer = neurons_per_hidden_layer[i];
            }                     
        }
        
        no_of_weights += neurons_in_previous_layer*no_of_output;
       
        neurons = new float[no_of_biases];
        biases = new float[no_of_biases];          
        weights = new float[no_of_weights];
               
        output = new float[no_of_output];
        
        /*println(no_of_weights);
         println(no_of_biases);
          println(no_of_hidden_neurons);*/
    }
    
    void init_weights_and_biases_randomly()
    {
       for(int i=0; i < weights.length; i++)
       {
          this.weights[i] = random(-varians,varians);
       }
       for(int i=0; i < biases.length; i++)
       {
         this.biases[i] = random(-1.0,1.0);
       }    
    }
    
    void init_weights_and_biases(float[] weights, float[] biases)
    {           
        for(int i=0;i<weights.length;i++)
        {
          this.weights[i] = weights[i];
        }
        for(int i=0;i<biases.length;i++)
        {
          this.biases[i] = biases[i];
        }
    }
    
    
     
    float[] getOutput(float[] in)
    {                   
       int bi = 0;
       int ni = 0;
       int wi = 0;
              
       //input neurons
       for(int n=0;n<in.length;n++)
       {         
          neurons[n] = 0;
          for(int i=0;i<in.length;i++)
          {
             neurons[n] += in[i]*weights[wi];
             wi++;
          }
          neurons[n] += biases[bi];
          bi++;
       }
       
       int no_of_neurons_in_previous_layer = in.length;
       int ni_prev_layer = 0;
       
       //hidden neurons             
       if(neurons_per_hidden_layer != null)
       {              
         
         //iterate through hidden layers
         for(int l=0;l<neurons_per_hidden_layer.length;l++)
         {
            //iterate through neurons in current layer
            for(int n=0;n<neurons_per_hidden_layer[l];n++)
            {
               //iterate through weights for current neuron
               neurons[ni] = 0;
               for(int i=0;i<no_of_neurons_in_previous_layer;i++)
               {
                  neurons[ni] += neurons[ni_prev_layer+i]*weights[wi];
                  wi++;
               }
               neurons[ni++] += biases[bi++];             
            }
            ni_prev_layer += no_of_neurons_in_previous_layer;
            no_of_neurons_in_previous_layer = neurons_per_hidden_layer[l];
         }
      }
              
      //output layer
      for(int n=0;n<no_of_output;n++)
      {
         output[n] = 0;
         for(int i=0;i<no_of_neurons_in_previous_layer;i++)
         {
            output[n] += neurons[ni_prev_layer+i]*weights[wi];
            wi++;
         }
         output[n] += biases[bi++];                          
      }   
                               
       return output;
    }      
}
