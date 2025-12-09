#!/bin/bash
#SBATCH -J lab3-cut-job
#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno05/Lab3_Antonio/lab-git
#SBATCH -n 4                     # 4 tareas en paralelo
#SBATCH --cpus-per-task=2        # cada tarea usa 2 cores

set -euo pipefail

echo "Directorio de trabajo: $(pwd)"
echo "Listado inicial:"
ls -l *.fastq || true

# Cada tarea procesa un fichero distinto
srun -n1 ./file-cut.sh Sample1.fastq &
srun -n1 ./file-cut.sh Sample2.fastq &
srun -n1 ./file-cut.sh Sample3.fastq &
srun -n1 ./file-cut.sh Sample4.fastq &

wait

echo "Listado final:"
ls -l *.fastq || true

