import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import io

def process_benchmark_data():
    """
    Returns the benchmark data as a pandas DataFrame
    """
#     data = """benchmark-name,qemu,rvdbt-jit,rvdbt-qcgaot,rvdbt-llvmaot,rvlinux-bt
# numeric-sort,1.000,1.293,1.399,2.028,1.174
# string-sort,1.000,0.999,0.997,2.819,0.635
# bitfield,1.000,0.700,0.681,1.923,1.207
# emfloat,1.000,0.966,0.806,4.085,0.916
# assignment,1.000,1.250,1.327,2.197,1.195
# IDEA,1.000,1.523,1.958,3.360,2.372
# Huffman,1.000,1.272,1.093,2.595,1.205
# dhrystone,1.000,0.864,0.839,2.374,1.348
# primes,1.000,1.003,0.978,1.837,1.100
# sha512,1.000,0.588,0.525,2.319,1.022"""
    data = """benchmark-name,qemu,rvlinux-bt
numeric-sort,1.000,1.033
string-sort,1.000,0.609
bitfield,1.000,1.178
emfloat,1.000,0.924
assignment,1.000,1.201
IDEA,1.000,1.332
Huffman,1.000,1.174
dhrystone,1.000,1.319
primes,1.000,1.087
sha512,1.000,1.01"""
    # Read data and reverse the order of workloads
    df = pd.read_csv(io.StringIO(data))
    return df.iloc[::-1].reset_index(drop=True)

def plot_benchmark_comparison(df, output_path='benchmark_comparison.png'):
    """
    Create a horizontal clustered bar chart from benchmark data.
    """
    # Set up the plot
    plt.figure(figsize=(10, 12))

    # Set height of bars and positions
    barHeight = 0.15
    executors = df.columns[1:]  # Skip 'benchmark-name' column
    n_executors = len(executors)
    
    # Create positions for bars
    positions = [np.arange(len(df['benchmark-name'])) + i * barHeight for i in range(n_executors)]

    # Color scheme
    colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd']

    # Create horizontal bars
    for i, (executor, color) in enumerate(zip(executors, colors)):
        plt.barh(positions[i], df[executor], height=barHeight, label=executor, color=color)

    # Add x-axis label only
    plt.xlabel('Performance')
    
    # Set y-ticks
    plt.yticks([r + barHeight*(n_executors-1)/2 for r in range(len(df['benchmark-name']))], 
               df['benchmark-name'])

    # Add legend
    plt.legend(bbox_to_anchor=(1.02, 1), loc='upper left')

    # Add grid
    plt.grid(True, axis='x', linestyle='--', alpha=0.7)

    # Adjust layout
    plt.tight_layout()

    # Save the plot
    plt.savefig(output_path, bbox_inches='tight', dpi=300)
    plt.close()

def main():
    df = process_benchmark_data()
    plot_benchmark_comparison(df)
    print("Plot has been saved as 'benchmark_comparison.png'")

if __name__ == "__main__":
    main()

