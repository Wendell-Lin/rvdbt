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
#     data = """benchmark-name,qemu,rvdbt-jit,rvdbt-jit-merge-ls,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-1000
# numeric-sort,1.000,1.324,1.339,2.137,1.345
# string-sort,1.000,0.998,1.005,3.196,1.010
# bitfield,1.000,0.678,0.702,2.033,0.702
# emfloat,1.000,0.956,0.953,4.351,2.146
# assignment,1.000,1.267,1.212,2.197,1.692
# IDEA,1.000,1.201,1.520,3.232,1.249
# Huffman,1.000,1.277,1.274,2.526,1.279
# dhrystone,1.000,0.853,1.028,2.414,1.717
# primes,1.000,1.011,0.997,1.534,1.000
# sha512,1.000,0.583,0.603,2.534,2.028"""
#     data="""benchmark-name,qemu,rvdbt-jit-merge-ls,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-1000,rvdbt-llvmaot-opt
# numeric-sort,1.000,1.179,1.927,1.953,1.949
# string-sort,1.000,0.779,3.371,3.315,3.326
# bitfield,1.000,0.955,2.001,2.000,2.001
# emfloat,1.000,0.803,4.335,4.288,4.310
# assignment,1.000,0.779,2.088,2.137,2.135
# Huffman,1.000,1.059,2.525,2.488,2.485
# dhrystone,1.000,0.948,2.455,1.752,1.754
# sha512,1.000,0.583,2.656,2.113,2.115"""
#     data="""benchmark-name,qemu,rvdbt-jit,rvdbt-jit-merge-ls,rvdbt-jit-brcc,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-1000,rvdbt-llvmaot-opt
# numeric-sort,1.000,1.230,1.230,1.188,1.922,1.949,1.946
# string-sort,1.000,1.001,1.000,0.792,3.378,3.320,3.317
# bitfield,1.000,1.039,1.035,0.934,2.006,2.007,2.002
# emfloat,1.000,0.874,0.883,0.843,4.374,4.312,4.317
# assignment,1.000,1.050,1.058,0.827,2.093,2.143,2.132
# Huffman,1.000,1.122,1.164,1.069,2.496,2.517,2.532
# dhrystone,1.000,0.823,1.014,0.974,2.426,1.738,1.738
# sha512,1.000,0.579,0.600,0.592,2.595,2.118,2.121"""
#     data = """benchmark-name,qemu,rvdbt-jit,rvdbt-qcgaot,rvdbt-llvmaot,rvlinux-bt
# sha512,1.000,0.583,0.520,2.550,1.039"""
#     data = """benchmark-name,qemu,rvlinux-bt
# numeric-sort,1.000,1.033
# string-sort,1.000,0.609
# bitfield,1.000,1.178
# emfloat,1.000,0.924
# assignment,1.000,1.201
# IDEA,1.000,1.332
# Huffman,1.000,1.174
# dhrystone,1.000,1.319
# primes,1.000,1.087
# sha512,1.000,1.01"""
#     data = """benchmark-name,qemu,rvdbt-jit,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-2
# bitcnts,1.000,1.995,4.896,4.598
# qsort_large,1.000,1.281,2.621,1.931
# susan,1.000,0.625,1.947,1.319
# fft,1.000,1.442,5.200,5.106
# toast,1.000,0.554,1.949,1.749
# coremark.exe,1.000,0.945,2.414,2.328
# x264,1.000,0.828,2.708,2.467
# xz,1.000,1.274,2.855,2.647
# perlbench,1.000,0.993,3.045,2.759
# mcf,1.000,1.863,3.885,3.885"""

    data="""benchmark-name,qemu,rvdbt-jit,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-1000
perlbench-1,1.000,1.335,3.319,2.437
perlbench-2,1.000,1.270,3.196,2.621
perlbench-3,1.000,1.136,3.424,2.567
"""
#     data="""benchmark-name,qemu,rvdbt-jit,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-1000
# mcf-1,1.000,1.147,2.305,2.271
# x264-1,1.000,0.831,2.613,2.605
# x264-2,1.000,0.812,2.494,2.484
# x264-3,1.000,0.802,2.493,2.522
# deepsjeng-1,1.000,1.164,3.446,2.949
# leela-1,1.000,1.550,3.660,3.585
# exchange2-1,1.000,0.639,2.276,2.282
# xz-1,1.000,1.067,1.730,1.723
# xz-2,1.000,0.854,1.761,1.815
# xz-3,1.000,0.959,1.924,1.932"""
#     data="""benchmark-name,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-1000
# mcf-1,263832,98360
# x264-1,1337976,765208
# x264-2,1462392,822680
# x264-3,1462680,794456
# deepsjeng-1,525144,313240
# leela-1,749648,231984
# exchange2-1,469464,243416
# xz-1,437848,158136
# xz-2,447064,167128
# xz-3,447224,158040
# """

#     data = """benchmark-name,rvdbt-llvmaot,rvdbt-llvmaot-hotspot-2
# bitcnts,1.000000,0.594872
# qsort_large,1.000000,0.574067
# susan,1.000000,0.543046
# fft,1.000000,0.755174
# toast,1.000000,0.535804
# coremark.exe,1.000000,0.462157
# x264,1.000000,0.781987
# xz,1.000000,0.612752
# perlbench,1.000000,0.873622
# mcf,1.000000,0.752312
# """
    # Read data and reverse the order of workloads
    df = pd.read_csv(io.StringIO(data))
    return df.iloc[::-1].reset_index(drop=True)

def plot_benchmark_comparison(df, output_path='benchmark_comparison.png'):
    """
    Create a horizontal clustered bar chart from benchmark data.
    """
    # Set up the plot
    n_workloads = len(df['benchmark-name'])
    height_per_workload = 1.5  # Height allocated for each workload
    min_height = 3  # Minimum figure height
    fig_height = max(min_height, n_workloads * height_per_workload)
    
    # Dynamic bar height based on number of workloads
    bar_height = min(0.15, 0.8 / n_workloads)  # Adjust bar height for fewer workloads
    
    # Set up the plot with dynamic size
    plt.figure(figsize=(10, fig_height))

    # Set height of bars and positions
    executors = df.columns[1:]  # Skip 'benchmark-name' column
    n_executors = len(executors)
    
    # Create positions for bars
    positions = [np.arange(len(df['benchmark-name'])) + (n_executors - 1 - i) * bar_height for i in range(n_executors)]

    # Color scheme
    # colors = ['#2ca02c', '#d62728']
    colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', '#e377c2']
    # colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#8c564b', '#d62728', '#9467bd', '#e377c2']

    # Create horizontal bars
    for i, (executor, color) in enumerate(zip(executors, colors)):
        plt.barh(positions[i], df[executor], height=bar_height, label=executor, color=color)

    # Add x-axis label only
    plt.xlabel('Performance')
    # plt.xlabel('AOT size')
    
    # Set y-ticks
    plt.yticks([r + bar_height*(n_executors-1)/2 for r in range(len(df['benchmark-name']))], 
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

