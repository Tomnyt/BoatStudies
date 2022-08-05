import torch

t = torch.tensor([
    [1, 1, 1, 1],
    [2, 2, 2, 2],
    [3, 3, 3, 3]
], dtype=torch.float32)

print(t.shape)
print(t.size())

print(t.shape == t.size())

rank = len(t.shape)
print(rank)

num_of_elements = torch.tensor(t.shape).prod()
print(t.numel() == num_of_elements)
print(t.numel())
