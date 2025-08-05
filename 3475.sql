


Table: Samples

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| sample_id      | int     |
| dna_sequence   | varchar |
| species        | varchar |
+----------------+---------+
sample_id is the unique key for this table.
Each row contains a DNA sequence represented as a string of
characters (A, T, G, C) and the species it was collected from.
Biologists are studying basic patterns in DNA sequences. Write a
solution to identify sample_id with the following patterns:

Sequences that start with ATG (a common start codon)
Sequences that end with either TAA, TAG, or TGA (stop codons)
Sequences containing the motif ATAT (a simple repeated pattern)
Sequences that have at least 3 consecutive G (like GGG or GGGG)
Return the result table ordered by sample_id in ascending order.

SELECT sample_id, dna_sequence, species, IF(InStr(dna_sequence, 'ATG') = 1, 1, 0) AS has_start,
IF(IF(InStr(dna_sequence, 'TAA') = LENGTH(dna_sequence) - 2, 1, 0) + IF(InStr(dna_sequence, 'TAG') = LENGTH(dna_sequence) - 2, 1, 0) + IF(InStr(dna_sequence, 'TGA') = LENGTH(dna_sequence) - 2, 1, 0) > 0, 1, 0) AS has_stop,
IF(InStr(dna_sequence, 'ATAT') != 0, 1, 0) AS has_atat,
IF(InStr(dna_sequence, 'GGG') != 0, 1, 0) AS has_ggg
FROM Samples