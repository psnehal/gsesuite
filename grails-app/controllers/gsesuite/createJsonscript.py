from clustergrammer import Network
import sys
filename = sys.argv[-1]
net = Network()
print("Python is fun.")
print(filename)
filepath = '/Users/snehalpatil/Documents/GithubProjects/gsesuite/heatmaps/'+(filename)
print(filepath)
net.load_file(filepath)
net.cluster()

jsonname = filename.replace(".txt", ".json")

jsonfilepath  = '/Users/snehalpatil/Documents/GithubProjects/gsesuite/heatmaps/'+jsonname
net.write_json_to_file('viz',jsonfilepath )