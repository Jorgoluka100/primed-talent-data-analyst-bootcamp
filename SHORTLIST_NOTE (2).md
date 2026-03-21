{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [],
   "source": [
    "\n",
    "#Import the required Libraries.\n",
    "import numpy as np\n",
    "import pandas as pd\n",
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Data Cleaning "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Data Reading & Data Types "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "#Read the data in pandas\n",
    "inp0= pd.read_csv(\"C:\\\\Users\\\\Karth\\\\OneDrive\\\\Desktop\\\\KM\\\\Data Analytics\\\\TOPIC 10C\\\\Attribute_DataSet.csv\")\n",
    "inp1= pd.read_csv(\"C:\\\\Users\\\\Karth\\\\OneDrive\\\\Desktop\\\\KM\\\\Data Analytics\\\\TOPIC 10C\\\\Dress_Sales.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Dress_ID</th>\n",
       "      <th>Style</th>\n",
       "      <th>Price</th>\n",
       "      <th>Rating</th>\n",
       "      <th>Size</th>\n",
       "      <th>Season</th>\n",
       "      <th>NeckLine</th>\n",
       "      <th>SleeveLength</th>\n",
       "      <th>Material</th>\n",
       "      <th>FabricType</th>\n",
       "      <th>Decoration</th>\n",
       "      <th>Pattern Type</th>\n",
       "      <th>Recommendation</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1006032852</td>\n",
       "      <td>Sexy</td>\n",
       "      <td>Low</td>\n",
       "      <td>4.6</td>\n",
       "      <td>M</td>\n",
       "      <td>Summer</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>sleevless</td>\n",
       "      <td>NaN</td>\n",
       "      <td>chiffon</td>\n",
       "      <td>ruffles</td>\n",
       "      <td>animal</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>1212192089</td>\n",
       "      <td>Casual</td>\n",
       "      <td>Low</td>\n",
       "      <td>0.0</td>\n",
       "      <td>L</td>\n",
       "      <td>Summer</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>Petal</td>\n",
       "      <td>microfiber</td>\n",
       "      <td>NaN</td>\n",
       "      <td>ruffles</td>\n",
       "      <td>animal</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1190380701</td>\n",
       "      <td>vintage</td>\n",
       "      <td>High</td>\n",
       "      <td>0.0</td>\n",
       "      <td>L</td>\n",
       "      <td>Automn</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>full</td>\n",
       "      <td>polyster</td>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "      <td>print</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>966005983</td>\n",
       "      <td>Brief</td>\n",
       "      <td>Average</td>\n",
       "      <td>4.6</td>\n",
       "      <td>L</td>\n",
       "      <td>Spring</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>full</td>\n",
       "      <td>silk</td>\n",
       "      <td>chiffon</td>\n",
       "      <td>embroidary</td>\n",
       "      <td>print</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>876339541</td>\n",
       "      <td>cute</td>\n",
       "      <td>Low</td>\n",
       "      <td>4.5</td>\n",
       "      <td>M</td>\n",
       "      <td>Summer</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>butterfly</td>\n",
       "      <td>chiffonfabric</td>\n",
       "      <td>chiffon</td>\n",
       "      <td>bow</td>\n",
       "      <td>dot</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "     Dress_ID    Style    Price  Rating Size  Season NeckLine SleeveLength  \\\n",
       "0  1006032852     Sexy      Low     4.6    M  Summer   o-neck    sleevless   \n",
       "1  1212192089   Casual      Low     0.0    L  Summer   o-neck        Petal   \n",
       "2  1190380701  vintage     High     0.0    L  Automn   o-neck         full   \n",
       "3   966005983    Brief  Average     4.6    L  Spring   o-neck         full   \n",
       "4   876339541     cute      Low     4.5    M  Summer   o-neck    butterfly   \n",
       "\n",
       "        Material FabricType  Decoration Pattern Type  Recommendation  \n",
       "0            NaN    chiffon     ruffles       animal               1  \n",
       "1     microfiber        NaN     ruffles       animal               0  \n",
       "2       polyster        NaN         NaN        print               0  \n",
       "3           silk    chiffon  embroidary        print               1  \n",
       "4  chiffonfabric    chiffon         bow          dot               0  "
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "inp0.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Dress_ID</th>\n",
       "      <th>29-08-2013</th>\n",
       "      <th>31-08-2013</th>\n",
       "      <th>09-02-2013</th>\n",
       "      <th>09-04-2013</th>\n",
       "      <th>09-06-2013</th>\n",
       "      <th>09-08-2013</th>\n",
       "      <th>09-10-2013</th>\n",
       "      <th>09-12-2013</th>\n",
       "      <th>14-09-2013</th>\n",
       "      <th>...</th>\n",
       "      <th>24-09-2013</th>\n",
       "      <th>26-09-2013</th>\n",
       "      <th>28-09-2013</th>\n",
       "      <th>30-09-2013</th>\n",
       "      <th>10-02-2013</th>\n",
       "      <th>10-04-2013</th>\n",
       "      <th>10-06-2013</th>\n",
       "      <th>10-08-2013</th>\n",
       "      <th>10-10-2013</th>\n",
       "      <th>10-12-2013</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1.006033e+09</td>\n",
       "      <td>2114</td>\n",
       "      <td>2274</td>\n",
       "      <td>2491</td>\n",
       "      <td>2660</td>\n",
       "      <td>2727</td>\n",
       "      <td>2887</td>\n",
       "      <td>2930</td>\n",
       "      <td>3119</td>\n",
       "      <td>3204</td>\n",
       "      <td>...</td>\n",
       "      <td>3554</td>\n",
       "      <td>3624.0</td>\n",
       "      <td>3706</td>\n",
       "      <td>3746.0</td>\n",
       "      <td>3795.0</td>\n",
       "      <td>3832.0</td>\n",
       "      <td>3897</td>\n",
       "      <td>3923.0</td>\n",
       "      <td>3985.0</td>\n",
       "      <td>4048</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>1.212192e+09</td>\n",
       "      <td>151</td>\n",
       "      <td>275</td>\n",
       "      <td>570</td>\n",
       "      <td>750</td>\n",
       "      <td>813</td>\n",
       "      <td>1066</td>\n",
       "      <td>1164</td>\n",
       "      <td>1558</td>\n",
       "      <td>1756</td>\n",
       "      <td>...</td>\n",
       "      <td>2710</td>\n",
       "      <td>2942.0</td>\n",
       "      <td>3258</td>\n",
       "      <td>3354.0</td>\n",
       "      <td>3475.0</td>\n",
       "      <td>3654.0</td>\n",
       "      <td>3911</td>\n",
       "      <td>4024.0</td>\n",
       "      <td>4125.0</td>\n",
       "      <td>4277</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1.190381e+09</td>\n",
       "      <td>6</td>\n",
       "      <td>7</td>\n",
       "      <td>7</td>\n",
       "      <td>7</td>\n",
       "      <td>8</td>\n",
       "      <td>8</td>\n",
       "      <td>9</td>\n",
       "      <td>10</td>\n",
       "      <td>10</td>\n",
       "      <td>...</td>\n",
       "      <td>11</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>9.660060e+08</td>\n",
       "      <td>1005</td>\n",
       "      <td>1128</td>\n",
       "      <td>1326</td>\n",
       "      <td>1455</td>\n",
       "      <td>1507</td>\n",
       "      <td>1621</td>\n",
       "      <td>1637</td>\n",
       "      <td>1723</td>\n",
       "      <td>1746</td>\n",
       "      <td>...</td>\n",
       "      <td>1878</td>\n",
       "      <td>1892.0</td>\n",
       "      <td>1914</td>\n",
       "      <td>1924.0</td>\n",
       "      <td>1929.0</td>\n",
       "      <td>1941.0</td>\n",
       "      <td>1952</td>\n",
       "      <td>1955.0</td>\n",
       "      <td>1959.0</td>\n",
       "      <td>1963</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>8.763395e+08</td>\n",
       "      <td>996</td>\n",
       "      <td>1175</td>\n",
       "      <td>1304</td>\n",
       "      <td>1396</td>\n",
       "      <td>1432</td>\n",
       "      <td>1559</td>\n",
       "      <td>1570</td>\n",
       "      <td>1638</td>\n",
       "      <td>1655</td>\n",
       "      <td>...</td>\n",
       "      <td>2032</td>\n",
       "      <td>2156.0</td>\n",
       "      <td>2252</td>\n",
       "      <td>2312.0</td>\n",
       "      <td>2387.0</td>\n",
       "      <td>2459.0</td>\n",
       "      <td>2544</td>\n",
       "      <td>2614.0</td>\n",
       "      <td>2693.0</td>\n",
       "      <td>2736</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "<p>5 rows × 24 columns</p>\n",
       "</div>"
      ],
      "text/plain": [
       "       Dress_ID  29-08-2013  31-08-2013  09-02-2013  09-04-2013  09-06-2013  \\\n",
       "0  1.006033e+09        2114        2274        2491        2660        2727   \n",
       "1  1.212192e+09         151         275         570         750         813   \n",
       "2  1.190381e+09           6           7           7           7           8   \n",
       "3  9.660060e+08        1005        1128        1326        1455        1507   \n",
       "4  8.763395e+08         996        1175        1304        1396        1432   \n",
       "\n",
       "   09-08-2013  09-10-2013 09-12-2013 14-09-2013  ... 24-09-2013 26-09-2013  \\\n",
       "0        2887        2930       3119       3204  ...       3554     3624.0   \n",
       "1        1066        1164       1558       1756  ...       2710     2942.0   \n",
       "2           8           9         10         10  ...         11       11.0   \n",
       "3        1621        1637       1723       1746  ...       1878     1892.0   \n",
       "4        1559        1570       1638       1655  ...       2032     2156.0   \n",
       "\n",
       "  28-09-2013 30-09-2013  10-02-2013  10-04-2013  10-06-2013  10-08-2013  \\\n",
       "0       3706     3746.0      3795.0      3832.0        3897      3923.0   \n",
       "1       3258     3354.0      3475.0      3654.0        3911      4024.0   \n",
       "2         11       11.0        11.0        11.0          11        11.0   \n",
       "3       1914     1924.0      1929.0      1941.0        1952      1955.0   \n",
       "4       2252     2312.0      2387.0      2459.0        2544      2614.0   \n",
       "\n",
       "   10-10-2013  10-12-2013  \n",
       "0      3985.0        4048  \n",
       "1      4125.0        4277  \n",
       "2        11.0          11  \n",
       "3      1959.0        1963  \n",
       "4      2693.0        2736  \n",
       "\n",
       "[5 rows x 24 columns]"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "inp1.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Dataset 1 shape: (479, 13)\n",
      "Dataset 2 shape: (479, 24)\n",
      "\n",
      "Dataset 1 info:\n",
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 479 entries, 0 to 478\n",
      "Data columns (total 13 columns):\n",
      " #   Column          Non-Null Count  Dtype  \n",
      "---  ------          --------------  -----  \n",
      " 0   Dress_ID        479 non-null    int64  \n",
      " 1   Style           479 non-null    object \n",
      " 2   Price           477 non-null    object \n",
      " 3   Rating          479 non-null    float64\n",
      " 4   Size            479 non-null    object \n",
      " 5   Season          477 non-null    object \n",
      " 6   NeckLine        476 non-null    object \n",
      " 7   SleeveLength    477 non-null    object \n",
      " 8   Material        360 non-null    object \n",
      " 9   FabricType      223 non-null    object \n",
      " 10  Decoration      255 non-null    object \n",
      " 11  Pattern Type    377 non-null    object \n",
      " 12  Recommendation  479 non-null    int64  \n",
      "dtypes: float64(1), int64(2), object(10)\n",
      "memory usage: 48.8+ KB\n",
      "\n",
      "Dataset 2 info:\n",
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 479 entries, 0 to 478\n",
      "Data columns (total 24 columns):\n",
      " #   Column      Non-Null Count  Dtype  \n",
      "---  ------      --------------  -----  \n",
      " 0   Dress_ID    479 non-null    float64\n",
      " 1   29-08-2013  479 non-null    int64  \n",
      " 2   31-08-2013  479 non-null    int64  \n",
      " 3   09-02-2013  479 non-null    int64  \n",
      " 4   09-04-2013  479 non-null    int64  \n",
      " 5   09-06-2013  479 non-null    int64  \n",
      " 6   09-08-2013  479 non-null    int64  \n",
      " 7   09-10-2013  479 non-null    int64  \n",
      " 8   09-12-2013  479 non-null    object \n",
      " 9   14-09-2013  479 non-null    object \n",
      " 10  16-09-2013  479 non-null    object \n",
      " 11  18-09-2013  479 non-null    object \n",
      " 12  20-09-2013  479 non-null    object \n",
      " 13  22-09-2013  479 non-null    object \n",
      " 14  24-09-2013  479 non-null    int64  \n",
      " 15  26-09-2013  257 non-null    float64\n",
      " 16  28-09-2013  479 non-null    int64  \n",
      " 17  30-09-2013  222 non-null    float64\n",
      " 18  10-02-2013  220 non-null    float64\n",
      " 19  10-04-2013  221 non-null    float64\n",
      " 20  10-06-2013  479 non-null    int64  \n",
      " 21  10-08-2013  224 non-null    float64\n",
      " 22  10-10-2013  224 non-null    float64\n",
      " 23  10-12-2013  479 non-null    int64  \n",
      "dtypes: float64(7), int64(11), object(6)\n",
      "memory usage: 89.9+ KB\n"
     ]
    }
   ],
   "source": [
    "print(f\"Dataset 1 shape: {inp0.shape}\")\n",
    "print(f\"Dataset 2 shape: {inp1.shape}\")\n",
    "print(\"\\nDataset 1 info:\")\n",
    "inp0.info()\n",
    "print(\"\\nDataset 2 info:\")\n",
    "inp1.info()\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "You have “Attribute DataSet” which contains a column named “Price”. Choose the correct statement from the following about its data type and variable type.\n",
    "- Integer type and numerical variable\n",
    "- Object type and categorical ordinal variable\n",
    "- Object type and categorical nominal variable\n",
    "- Float type and categorical variable.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "There is another column in “Attribute DataSet” named as “Recommendation”, choose the correct statement about its data type and variable type.\n",
    "- Integer type and categorical\n",
    "- Object type and categorical\n",
    "- Integer type and continuous numerical\n",
    "- Object type only.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following column do you think are of no use in “Attribute DataSet”.\n",
    "- Dress_ID\n",
    "- Price\n",
    "- Size and material\n",
    "- NeckLine\n",
    "- None of the above\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Attribute dataset in 'Price' column of Dataset 1: Object type and categorical nominal variable\n",
      "['Low' 'High' 'Average' 'Medium' 'very-high' nan]\n",
      "\n",
      "Attribute dataset in 'Recommendation' column of Dataset 1: Integer type and categorical\n",
      "[1 0]\n",
      "\n",
      "Attribute dataset of no use in Dataset 1: Size and Material\n",
      "['M' 'L' 'XL' 'free' 'S' 'small' 's']\n",
      "[nan 'microfiber' 'polyster' 'silk' 'chiffonfabric' 'cotton' 'nylon'\n",
      " 'other' 'milksilk' 'linen' 'rayon' 'lycra' 'mix' 'acrylic' 'spandex'\n",
      " 'lace' 'modal' 'cashmere' 'viscos' 'sill' 'wool' 'model' 'shiffon']\n"
     ]
    }
   ],
   "source": [
    "# Print the information about the attributes of inp0 and inp1.\n",
    "# print Attribute DataSet for 'price' as Object type and categorical nominal variable\n",
    "print(\"\\nAttribute dataset in 'Price' column of Dataset 1: Object type and categorical nominal variable\")\n",
    "print(inp0['Price'].unique())\n",
    "print(\"\\nAttribute dataset in 'Recommendation' column of Dataset 1: Integer type and categorical\")\n",
    "print(inp0['Recommendation'].unique())\n",
    "print(\"\\nAttribute dataset of no use in Dataset 1: Size and Material\")\n",
    "print(inp0['Size'].unique())\n",
    "print(inp0['Material'].unique())\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Fixing the Rows and Columns "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "As you can see, there is a column in “Attribute Dataset” named as ‘Size’. This column contains the values in abbreviation format. Write a code in Python to convert the followings:\n",
    "\n",
    "- M into  “Medium”\n",
    "- L into  “Large”\n",
    "- XL into “Extra large”\n",
    "- free into “Free”\n",
    "- S, s & small into “Small”.\n",
    "\n",
    "Now once you are done with changes in the dataset, what is the value of the lowest percentage, the highest percentage and the percentage of Small size categories in the column named “Size”?\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Updated 'Size' column in Dataset 1:\n",
      "[nan]\n",
      "Lowest percentage: 100.0%\n",
      "Highest percentage: 100.0%\n",
      "Percentage of Small size categories: 0%\n"
     ]
    }
   ],
   "source": [
    "#Write a code in Python to convert the followings:\n",
    "\n",
    "# Define a mapping dictionary\n",
    "size_mapping = {\n",
    "    'M': 'Medium',\n",
    "    'L': 'Large',\n",
    "    'XL': 'Extra large',\n",
    "    'free': 'Free',\n",
    "    'S': 'Small',\n",
    "    's': 'Small',\n",
    "    'small': 'Small'\n",
    "}\n",
    "# Apply the mapping to the 'Size' column\n",
    "inp0['Size'] = inp0['Size'].map(size_mapping)\n",
    "# Display the updated 'Size' column\n",
    "print(\"\\nUpdated 'Size' column in Dataset 1:\")\n",
    "print(inp0['Size'].unique())\n",
    "\n",
    "# Calculate the percentage of each size category\n",
    "size_percentages = inp0['Size'].value_counts(normalize=True, dropna=False) * 100\n",
    "\n",
    "# Display the lowest, highest, and percentage of Small size categories\n",
    "lowest_percentage = size_percentages.min()\n",
    "highest_percentage = size_percentages.max()\n",
    "small_percentage = size_percentages.get('Small', 0)\n",
    "\n",
    "print(f\"Lowest percentage: {lowest_percentage}%\")\n",
    "print(f\"Highest percentage: {highest_percentage}%\")\n",
    "print(f\"Percentage of Small size categories: {small_percentage}%\")\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Column fixing, correcting size abbreviation. count the percentage of each size category in \"Size\" column.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Print the value counts of each category in \"Size\" column.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Impute/Remove Missing values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "1189\n",
      "1506\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "Dress_ID            0\n",
       "Style               0\n",
       "Price               2\n",
       "Rating              0\n",
       "Size              479\n",
       "Season              2\n",
       "NeckLine            3\n",
       "SleeveLength        2\n",
       "Material          119\n",
       "FabricType        256\n",
       "Decoration        224\n",
       "Pattern Type      102\n",
       "Recommendation      0\n",
       "dtype: int64"
      ]
     },
     "execution_count": 31,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Print the null count of each variables of inp0 and inp1.\n",
    "print(sum(inp0.isnull().sum()))\n",
    "print(sum(inp1.isnull().sum()))\n",
    "inp0.isnull().sum()\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "You are given another dataset named “Dress Sales”. Now if you observe the datatypes of the columns using ‘inp1.info()’ command, you can identify that there are certain columns defined as object data type though they primarily consist of numeric data.\n",
    "\n",
    "Now if you try and convert these object data type columns into numeric data type(float), you will come across an error message. Try to correct this error.\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 479 entries, 0 to 478\n",
      "Data columns (total 24 columns):\n",
      " #   Column      Non-Null Count  Dtype  \n",
      "---  ------      --------------  -----  \n",
      " 0   Dress_ID    479 non-null    float64\n",
      " 1   29-08-2013  479 non-null    int64  \n",
      " 2   31-08-2013  479 non-null    int64  \n",
      " 3   09-02-2013  479 non-null    int64  \n",
      " 4   09-04-2013  479 non-null    int64  \n",
      " 5   09-06-2013  479 non-null    int64  \n",
      " 6   09-08-2013  479 non-null    int64  \n",
      " 7   09-10-2013  479 non-null    int64  \n",
      " 8   09-12-2013  479 non-null    object \n",
      " 9   14-09-2013  479 non-null    object \n",
      " 10  16-09-2013  479 non-null    object \n",
      " 11  18-09-2013  479 non-null    object \n",
      " 12  20-09-2013  479 non-null    object \n",
      " 13  22-09-2013  479 non-null    object \n",
      " 14  24-09-2013  479 non-null    int64  \n",
      " 15  26-09-2013  257 non-null    float64\n",
      " 16  28-09-2013  479 non-null    int64  \n",
      " 17  30-09-2013  222 non-null    float64\n",
      " 18  10-02-2013  220 non-null    float64\n",
      " 19  10-04-2013  221 non-null    float64\n",
      " 20  10-06-2013  479 non-null    int64  \n",
      " 21  10-08-2013  224 non-null    float64\n",
      " 22  10-10-2013  224 non-null    float64\n",
      " 23  10-12-2013  479 non-null    int64  \n",
      "dtypes: float64(7), int64(11), object(6)\n",
      "memory usage: 89.9+ KB\n"
     ]
    }
   ],
   "source": [
    "# Print the data types information of inp1 i.e. \"Dress Sales\" data.\n",
    "inp1.info()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "metadata": {},
   "outputs": [
    {
     "ename": "ValueError",
     "evalue": "could not convert string to float: 'Low'",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mValueError\u001b[0m                                Traceback (most recent call last)",
      "Cell \u001b[1;32mIn[33], line 2\u001b[0m\n\u001b[0;32m      1\u001b[0m \u001b[38;5;66;03m# Try to convert the object type into float type of data. YOU GET ERROR MESSAGE.\u001b[39;00m\n\u001b[1;32m----> 2\u001b[0m inp0[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mPrice\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m=\u001b[39m inp0[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mPrice\u001b[39m\u001b[38;5;124m'\u001b[39m]\u001b[38;5;241m.\u001b[39mastype(\u001b[38;5;28mfloat\u001b[39m)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\generic.py:6643\u001b[0m, in \u001b[0;36mNDFrame.astype\u001b[1;34m(self, dtype, copy, errors)\u001b[0m\n\u001b[0;32m   6637\u001b[0m     results \u001b[38;5;241m=\u001b[39m [\n\u001b[0;32m   6638\u001b[0m         ser\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39mcopy, errors\u001b[38;5;241m=\u001b[39merrors) \u001b[38;5;28;01mfor\u001b[39;00m _, ser \u001b[38;5;129;01min\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39mitems()\n\u001b[0;32m   6639\u001b[0m     ]\n\u001b[0;32m   6641\u001b[0m \u001b[38;5;28;01melse\u001b[39;00m:\n\u001b[0;32m   6642\u001b[0m     \u001b[38;5;66;03m# else, only a single dtype is given\u001b[39;00m\n\u001b[1;32m-> 6643\u001b[0m     new_data \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_mgr\u001b[38;5;241m.\u001b[39mastype(dtype\u001b[38;5;241m=\u001b[39mdtype, copy\u001b[38;5;241m=\u001b[39mcopy, errors\u001b[38;5;241m=\u001b[39merrors)\n\u001b[0;32m   6644\u001b[0m     res \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_constructor_from_mgr(new_data, axes\u001b[38;5;241m=\u001b[39mnew_data\u001b[38;5;241m.\u001b[39maxes)\n\u001b[0;32m   6645\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m res\u001b[38;5;241m.\u001b[39m__finalize__(\u001b[38;5;28mself\u001b[39m, method\u001b[38;5;241m=\u001b[39m\u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mastype\u001b[39m\u001b[38;5;124m\"\u001b[39m)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\internals\\managers.py:430\u001b[0m, in \u001b[0;36mBaseBlockManager.astype\u001b[1;34m(self, dtype, copy, errors)\u001b[0m\n\u001b[0;32m    427\u001b[0m \u001b[38;5;28;01melif\u001b[39;00m using_copy_on_write():\n\u001b[0;32m    428\u001b[0m     copy \u001b[38;5;241m=\u001b[39m \u001b[38;5;28;01mFalse\u001b[39;00m\n\u001b[1;32m--> 430\u001b[0m \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39mapply(\n\u001b[0;32m    431\u001b[0m     \u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mastype\u001b[39m\u001b[38;5;124m\"\u001b[39m,\n\u001b[0;32m    432\u001b[0m     dtype\u001b[38;5;241m=\u001b[39mdtype,\n\u001b[0;32m    433\u001b[0m     copy\u001b[38;5;241m=\u001b[39mcopy,\n\u001b[0;32m    434\u001b[0m     errors\u001b[38;5;241m=\u001b[39merrors,\n\u001b[0;32m    435\u001b[0m     using_cow\u001b[38;5;241m=\u001b[39musing_copy_on_write(),\n\u001b[0;32m    436\u001b[0m )\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\internals\\managers.py:363\u001b[0m, in \u001b[0;36mBaseBlockManager.apply\u001b[1;34m(self, f, align_keys, **kwargs)\u001b[0m\n\u001b[0;32m    361\u001b[0m         applied \u001b[38;5;241m=\u001b[39m b\u001b[38;5;241m.\u001b[39mapply(f, \u001b[38;5;241m*\u001b[39m\u001b[38;5;241m*\u001b[39mkwargs)\n\u001b[0;32m    362\u001b[0m     \u001b[38;5;28;01melse\u001b[39;00m:\n\u001b[1;32m--> 363\u001b[0m         applied \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mgetattr\u001b[39m(b, f)(\u001b[38;5;241m*\u001b[39m\u001b[38;5;241m*\u001b[39mkwargs)\n\u001b[0;32m    364\u001b[0m     result_blocks \u001b[38;5;241m=\u001b[39m extend_blocks(applied, result_blocks)\n\u001b[0;32m    366\u001b[0m out \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mtype\u001b[39m(\u001b[38;5;28mself\u001b[39m)\u001b[38;5;241m.\u001b[39mfrom_blocks(result_blocks, \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39maxes)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\internals\\blocks.py:758\u001b[0m, in \u001b[0;36mBlock.astype\u001b[1;34m(self, dtype, copy, errors, using_cow, squeeze)\u001b[0m\n\u001b[0;32m    755\u001b[0m         \u001b[38;5;28;01mraise\u001b[39;00m \u001b[38;5;167;01mValueError\u001b[39;00m(\u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mCan not squeeze with more than one column.\u001b[39m\u001b[38;5;124m\"\u001b[39m)\n\u001b[0;32m    756\u001b[0m     values \u001b[38;5;241m=\u001b[39m values[\u001b[38;5;241m0\u001b[39m, :]  \u001b[38;5;66;03m# type: ignore[call-overload]\u001b[39;00m\n\u001b[1;32m--> 758\u001b[0m new_values \u001b[38;5;241m=\u001b[39m astype_array_safe(values, dtype, copy\u001b[38;5;241m=\u001b[39mcopy, errors\u001b[38;5;241m=\u001b[39merrors)\n\u001b[0;32m    760\u001b[0m new_values \u001b[38;5;241m=\u001b[39m maybe_coerce_values(new_values)\n\u001b[0;32m    762\u001b[0m refs \u001b[38;5;241m=\u001b[39m \u001b[38;5;28;01mNone\u001b[39;00m\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\dtypes\\astype.py:237\u001b[0m, in \u001b[0;36mastype_array_safe\u001b[1;34m(values, dtype, copy, errors)\u001b[0m\n\u001b[0;32m    234\u001b[0m     dtype \u001b[38;5;241m=\u001b[39m dtype\u001b[38;5;241m.\u001b[39mnumpy_dtype\n\u001b[0;32m    236\u001b[0m \u001b[38;5;28;01mtry\u001b[39;00m:\n\u001b[1;32m--> 237\u001b[0m     new_values \u001b[38;5;241m=\u001b[39m astype_array(values, dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n\u001b[0;32m    238\u001b[0m \u001b[38;5;28;01mexcept\u001b[39;00m (\u001b[38;5;167;01mValueError\u001b[39;00m, \u001b[38;5;167;01mTypeError\u001b[39;00m):\n\u001b[0;32m    239\u001b[0m     \u001b[38;5;66;03m# e.g. _astype_nansafe can fail on object-dtype of strings\u001b[39;00m\n\u001b[0;32m    240\u001b[0m     \u001b[38;5;66;03m#  trying to convert to float\u001b[39;00m\n\u001b[0;32m    241\u001b[0m     \u001b[38;5;28;01mif\u001b[39;00m errors \u001b[38;5;241m==\u001b[39m \u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mignore\u001b[39m\u001b[38;5;124m\"\u001b[39m:\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\dtypes\\astype.py:182\u001b[0m, in \u001b[0;36mastype_array\u001b[1;34m(values, dtype, copy)\u001b[0m\n\u001b[0;32m    179\u001b[0m     values \u001b[38;5;241m=\u001b[39m values\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n\u001b[0;32m    181\u001b[0m \u001b[38;5;28;01melse\u001b[39;00m:\n\u001b[1;32m--> 182\u001b[0m     values \u001b[38;5;241m=\u001b[39m _astype_nansafe(values, dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n\u001b[0;32m    184\u001b[0m \u001b[38;5;66;03m# in pandas we don't store numpy str dtypes, so convert to object\u001b[39;00m\n\u001b[0;32m    185\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m \u001b[38;5;28misinstance\u001b[39m(dtype, np\u001b[38;5;241m.\u001b[39mdtype) \u001b[38;5;129;01mand\u001b[39;00m \u001b[38;5;28missubclass\u001b[39m(values\u001b[38;5;241m.\u001b[39mdtype\u001b[38;5;241m.\u001b[39mtype, \u001b[38;5;28mstr\u001b[39m):\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\dtypes\\astype.py:133\u001b[0m, in \u001b[0;36m_astype_nansafe\u001b[1;34m(arr, dtype, copy, skipna)\u001b[0m\n\u001b[0;32m    129\u001b[0m     \u001b[38;5;28;01mraise\u001b[39;00m \u001b[38;5;167;01mValueError\u001b[39;00m(msg)\n\u001b[0;32m    131\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m copy \u001b[38;5;129;01mor\u001b[39;00m arr\u001b[38;5;241m.\u001b[39mdtype \u001b[38;5;241m==\u001b[39m \u001b[38;5;28mobject\u001b[39m \u001b[38;5;129;01mor\u001b[39;00m dtype \u001b[38;5;241m==\u001b[39m \u001b[38;5;28mobject\u001b[39m:\n\u001b[0;32m    132\u001b[0m     \u001b[38;5;66;03m# Explicit copy, or required since NumPy can't view from / to object.\u001b[39;00m\n\u001b[1;32m--> 133\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m arr\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39m\u001b[38;5;28;01mTrue\u001b[39;00m)\n\u001b[0;32m    135\u001b[0m \u001b[38;5;28;01mreturn\u001b[39;00m arr\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n",
      "\u001b[1;31mValueError\u001b[0m: could not convert string to float: 'Low'"
     ]
    }
   ],
   "source": [
    "# Try to convert the object type into float type of data. YOU GET ERROR MESSAGE.\n",
    "inp0['Price'] = inp0['Price'].astype(float)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Dress_ID      0\n",
       "29-08-2013    0\n",
       "31-08-2013    0\n",
       "09-02-2013    0\n",
       "09-04-2013    0\n",
       "09-06-2013    0\n",
       "09-08-2013    0\n",
       "09-10-2013    0\n",
       "09-12-2013    0\n",
       "14-09-2013    0\n",
       "16-09-2013    0\n",
       "18-09-2013    0\n",
       "20-09-2013    0\n",
       "22-09-2013    0\n",
       "24-09-2013    0\n",
       "26-09-2013    0\n",
       "28-09-2013    0\n",
       "30-09-2013    0\n",
       "10-02-2013    0\n",
       "10-04-2013    0\n",
       "10-06-2013    0\n",
       "10-08-2013    0\n",
       "10-10-2013    0\n",
       "10-12-2013    0\n",
       "dtype: int64"
      ]
     },
     "execution_count": 35,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Do the required changes in the \"Dress Sales\" data set to get null values on string values.\n",
    "\n",
    "inp1.isnull().sum()\n",
    "# fill the null values with 0\n",
    "inp1_filled = inp1.fillna(0)\n",
    "inp1_filled.isnull().sum()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Updated data types of inp1_filled:\n",
      "Dress_ID      float64\n",
      "29-08-2013      int64\n",
      "31-08-2013      int64\n",
      "09-02-2013      int64\n",
      "09-04-2013      int64\n",
      "09-06-2013      int64\n",
      "09-08-2013      int64\n",
      "09-10-2013      int64\n",
      "09-12-2013    float64\n",
      "14-09-2013    float64\n",
      "16-09-2013    float64\n",
      "18-09-2013    float64\n",
      "20-09-2013    float64\n",
      "22-09-2013    float64\n",
      "24-09-2013      int64\n",
      "26-09-2013    float64\n",
      "28-09-2013      int64\n",
      "30-09-2013    float64\n",
      "10-02-2013    float64\n",
      "10-04-2013    float64\n",
      "10-06-2013      int64\n",
      "10-08-2013    float64\n",
      "10-10-2013    float64\n",
      "10-12-2013      int64\n",
      "dtype: object\n"
     ]
    }
   ],
   "source": [
    "# Convert the object type columns in \"Dress Sales\" into float type of data type.\n",
    "# Identify the object type columns in inp1\n",
    "object_columns = inp1_filled.select_dtypes(include=['object']).columns\n",
    "# Convert the object type columns to float type\n",
    "for col in object_columns:\n",
    "    inp1_filled[col] = pd.to_numeric(inp1_filled[col], errors='coerce')\n",
    "# Display the updated data types of inp1_filled\n",
    "print(\"\\nUpdated data types of inp1_filled:\")\n",
    "print(inp1_filled.dtypes)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "When you see the null counts in “Dress Sales” dataset after performing all the operations that have been mentioned in jupyter notebook, you will find that there are some columns in “Dress Sales” data where there are more than 40% of missing values. Based on your understanding of dealing with missing values do the following steps."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Null percentage of each column in inp1:\n",
      "Dress_ID       0.000000\n",
      "29-08-2013     0.000000\n",
      "31-08-2013     0.000000\n",
      "09-02-2013     0.000000\n",
      "09-04-2013     0.000000\n",
      "09-06-2013     0.000000\n",
      "09-08-2013     0.000000\n",
      "09-10-2013     0.000000\n",
      "09-12-2013     0.000000\n",
      "14-09-2013     0.000000\n",
      "16-09-2013     0.000000\n",
      "18-09-2013     0.000000\n",
      "20-09-2013     0.000000\n",
      "22-09-2013     0.000000\n",
      "24-09-2013     0.000000\n",
      "26-09-2013    46.346555\n",
      "28-09-2013     0.000000\n",
      "30-09-2013    53.653445\n",
      "10-02-2013    54.070981\n",
      "10-04-2013    53.862213\n",
      "10-06-2013     0.000000\n",
      "10-08-2013    53.235908\n",
      "10-10-2013    53.235908\n",
      "10-12-2013     0.000000\n",
      "dtype: float64\n"
     ]
    }
   ],
   "source": [
    "# Print the null percetange of each column of inp1.\n",
    "null_percentage = inp1.isnull().mean() * 100\n",
    "print(\"\\nNull percentage of each column in inp1:\")\n",
    "print(null_percentage)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "Columns dropped from inp1:\n",
      "Index(['26-09-2013', '30-09-2013', '10-02-2013', '10-04-2013', '10-08-2013',\n",
      "       '10-10-2013'],\n",
      "      dtype='object')\n"
     ]
    }
   ],
   "source": [
    "# Drop the columns in \"Dress Sales\" which have more than 40% of missing values.\n",
    "# Calculate the percentage of missing values in each column\n",
    "missing_percentage = inp1.isnull().mean() * 100\n",
    "# Drop columns with more than 40% missing values\n",
    "columns_to_drop = missing_percentage[missing_percentage > 40].index\n",
    "inp1_dropped = inp1.drop(columns=columns_to_drop)\n",
    "# Display the columns that were dropped\n",
    "print(\"\\nColumns dropped from inp1:\")\n",
    "print(columns_to_drop)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "You should categorise the dates into seasons in “Dress Sales” data to simplify the analysis according to the following criteria:\n",
    "- June, July and August: Summer.\n",
    "- September, October and November: Autumn.\n",
    "- December, January and February: WInter.\n",
    "- March, April and May: Spring.\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "metadata": {},
   "outputs": [
    {
     "ename": "KeyError",
     "evalue": "'Date'",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mKeyError\u001b[0m                                  Traceback (most recent call last)",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\indexes\\base.py:3805\u001b[0m, in \u001b[0;36mIndex.get_loc\u001b[1;34m(self, key)\u001b[0m\n\u001b[0;32m   3804\u001b[0m \u001b[38;5;28;01mtry\u001b[39;00m:\n\u001b[1;32m-> 3805\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_engine\u001b[38;5;241m.\u001b[39mget_loc(casted_key)\n\u001b[0;32m   3806\u001b[0m \u001b[38;5;28;01mexcept\u001b[39;00m \u001b[38;5;167;01mKeyError\u001b[39;00m \u001b[38;5;28;01mas\u001b[39;00m err:\n",
      "File \u001b[1;32mindex.pyx:167\u001b[0m, in \u001b[0;36mpandas._libs.index.IndexEngine.get_loc\u001b[1;34m()\u001b[0m\n",
      "File \u001b[1;32mindex.pyx:196\u001b[0m, in \u001b[0;36mpandas._libs.index.IndexEngine.get_loc\u001b[1;34m()\u001b[0m\n",
      "File \u001b[1;32mpandas\\\\_libs\\\\hashtable_class_helper.pxi:7081\u001b[0m, in \u001b[0;36mpandas._libs.hashtable.PyObjectHashTable.get_item\u001b[1;34m()\u001b[0m\n",
      "File \u001b[1;32mpandas\\\\_libs\\\\hashtable_class_helper.pxi:7089\u001b[0m, in \u001b[0;36mpandas._libs.hashtable.PyObjectHashTable.get_item\u001b[1;34m()\u001b[0m\n",
      "\u001b[1;31mKeyError\u001b[0m: 'Date'",
      "\nThe above exception was the direct cause of the following exception:\n",
      "\u001b[1;31mKeyError\u001b[0m                                  Traceback (most recent call last)",
      "Cell \u001b[1;32mIn[41], line 2\u001b[0m\n\u001b[0;32m      1\u001b[0m \u001b[38;5;66;03m# calculate the month from the column names in \"Dress Sales\" data set and create a new column named \"Month\".\u001b[39;00m\n\u001b[1;32m----> 2\u001b[0m inp1[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mMonth\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m=\u001b[39m pd\u001b[38;5;241m.\u001b[39mto_datetime(inp1[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mDate\u001b[39m\u001b[38;5;124m'\u001b[39m], errors\u001b[38;5;241m=\u001b[39m\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mcoerce\u001b[39m\u001b[38;5;124m'\u001b[39m)\u001b[38;5;241m.\u001b[39mdt\u001b[38;5;241m.\u001b[39mmonth\n\u001b[0;32m      3\u001b[0m \u001b[38;5;66;03m# Create the four seasons columns in inp1, according to the above criteria.\u001b[39;00m\n\u001b[0;32m      4\u001b[0m inp1[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mSpring\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m=\u001b[39m ((inp1[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mMonth\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m>\u001b[39m\u001b[38;5;241m=\u001b[39m \u001b[38;5;241m3\u001b[39m) \u001b[38;5;241m&\u001b[39m (inp1[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mMonth\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m<\u001b[39m\u001b[38;5;241m=\u001b[39m \u001b[38;5;241m5\u001b[39m))\u001b[38;5;241m.\u001b[39mastype(\u001b[38;5;28mint\u001b[39m)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\frame.py:4102\u001b[0m, in \u001b[0;36mDataFrame.__getitem__\u001b[1;34m(self, key)\u001b[0m\n\u001b[0;32m   4100\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39mcolumns\u001b[38;5;241m.\u001b[39mnlevels \u001b[38;5;241m>\u001b[39m \u001b[38;5;241m1\u001b[39m:\n\u001b[0;32m   4101\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_getitem_multilevel(key)\n\u001b[1;32m-> 4102\u001b[0m indexer \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39mcolumns\u001b[38;5;241m.\u001b[39mget_loc(key)\n\u001b[0;32m   4103\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m is_integer(indexer):\n\u001b[0;32m   4104\u001b[0m     indexer \u001b[38;5;241m=\u001b[39m [indexer]\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\indexes\\base.py:3812\u001b[0m, in \u001b[0;36mIndex.get_loc\u001b[1;34m(self, key)\u001b[0m\n\u001b[0;32m   3807\u001b[0m     \u001b[38;5;28;01mif\u001b[39;00m \u001b[38;5;28misinstance\u001b[39m(casted_key, \u001b[38;5;28mslice\u001b[39m) \u001b[38;5;129;01mor\u001b[39;00m (\n\u001b[0;32m   3808\u001b[0m         \u001b[38;5;28misinstance\u001b[39m(casted_key, abc\u001b[38;5;241m.\u001b[39mIterable)\n\u001b[0;32m   3809\u001b[0m         \u001b[38;5;129;01mand\u001b[39;00m \u001b[38;5;28many\u001b[39m(\u001b[38;5;28misinstance\u001b[39m(x, \u001b[38;5;28mslice\u001b[39m) \u001b[38;5;28;01mfor\u001b[39;00m x \u001b[38;5;129;01min\u001b[39;00m casted_key)\n\u001b[0;32m   3810\u001b[0m     ):\n\u001b[0;32m   3811\u001b[0m         \u001b[38;5;28;01mraise\u001b[39;00m InvalidIndexError(key)\n\u001b[1;32m-> 3812\u001b[0m     \u001b[38;5;28;01mraise\u001b[39;00m \u001b[38;5;167;01mKeyError\u001b[39;00m(key) \u001b[38;5;28;01mfrom\u001b[39;00m\u001b[38;5;250m \u001b[39m\u001b[38;5;21;01merr\u001b[39;00m\n\u001b[0;32m   3813\u001b[0m \u001b[38;5;28;01mexcept\u001b[39;00m \u001b[38;5;167;01mTypeError\u001b[39;00m:\n\u001b[0;32m   3814\u001b[0m     \u001b[38;5;66;03m# If we have a listlike key, _check_indexing_error will raise\u001b[39;00m\n\u001b[0;32m   3815\u001b[0m     \u001b[38;5;66;03m#  InvalidIndexError. Otherwise we fall through and re-raise\u001b[39;00m\n\u001b[0;32m   3816\u001b[0m     \u001b[38;5;66;03m#  the TypeError.\u001b[39;00m\n\u001b[0;32m   3817\u001b[0m     \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_check_indexing_error(key)\n",
      "\u001b[1;31mKeyError\u001b[0m: 'Date'"
     ]
    }
   ],
   "source": [
    "# calculate the month from the column names in \"Dress Sales\" data set and create a new column named \"Month\".\n",
    "inp1['Month'] = pd.to_datetime(inp1['Date'], errors='coerce').dt.month\n",
    "# Create the four seasons columns in inp1, according to the above criteria.\n",
    "inp1['Spring'] = ((inp1['Month'] >= 3) & (inp1['Month'] <= 5)).astype(int)\n",
    "inp1['Summer'] = ((inp1['Month'] >= 6) & (inp1['Month'] <= 8)).astype(int)\n",
    "inp1['Autumn'] = ((inp1['Month'] >= 9) & (inp1['Month'] <= 11)).astype(int)\n",
    "inp1['Winter'] = ((inp1['Month'] == 12) | (inp1['Month'] <= 2)).astype(int)\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# calculate the sum of sales in each seasons in inp1 i.e. \"Dress Sales\".\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Now let's merge inp1 with inp0 with left join manner, so that the information of inp0 should remain intact."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Dress_ID</th>\n",
       "      <th>Style</th>\n",
       "      <th>Price</th>\n",
       "      <th>Rating</th>\n",
       "      <th>Size</th>\n",
       "      <th>Season</th>\n",
       "      <th>NeckLine</th>\n",
       "      <th>SleeveLength</th>\n",
       "      <th>Material</th>\n",
       "      <th>FabricType</th>\n",
       "      <th>...</th>\n",
       "      <th>24-09-2013_y</th>\n",
       "      <th>26-09-2013_y</th>\n",
       "      <th>28-09-2013_y</th>\n",
       "      <th>30-09-2013_y</th>\n",
       "      <th>10-02-2013_y</th>\n",
       "      <th>10-04-2013_y</th>\n",
       "      <th>10-06-2013_y</th>\n",
       "      <th>10-08-2013_y</th>\n",
       "      <th>10-10-2013_y</th>\n",
       "      <th>10-12-2013_y</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1006032852</td>\n",
       "      <td>Sexy</td>\n",
       "      <td>Low</td>\n",
       "      <td>4.6</td>\n",
       "      <td>NaN</td>\n",
       "      <td>Summer</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>sleevless</td>\n",
       "      <td>NaN</td>\n",
       "      <td>chiffon</td>\n",
       "      <td>...</td>\n",
       "      <td>3554</td>\n",
       "      <td>3624.0</td>\n",
       "      <td>3706</td>\n",
       "      <td>3746.0</td>\n",
       "      <td>3795.0</td>\n",
       "      <td>3832.0</td>\n",
       "      <td>3897</td>\n",
       "      <td>3923.0</td>\n",
       "      <td>3985.0</td>\n",
       "      <td>4048</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>1212192089</td>\n",
       "      <td>Casual</td>\n",
       "      <td>Low</td>\n",
       "      <td>0.0</td>\n",
       "      <td>NaN</td>\n",
       "      <td>Summer</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>Petal</td>\n",
       "      <td>microfiber</td>\n",
       "      <td>NaN</td>\n",
       "      <td>...</td>\n",
       "      <td>2710</td>\n",
       "      <td>2942.0</td>\n",
       "      <td>3258</td>\n",
       "      <td>3354.0</td>\n",
       "      <td>3475.0</td>\n",
       "      <td>3654.0</td>\n",
       "      <td>3911</td>\n",
       "      <td>4024.0</td>\n",
       "      <td>4125.0</td>\n",
       "      <td>4277</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1190380701</td>\n",
       "      <td>vintage</td>\n",
       "      <td>High</td>\n",
       "      <td>0.0</td>\n",
       "      <td>NaN</td>\n",
       "      <td>Automn</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>full</td>\n",
       "      <td>polyster</td>\n",
       "      <td>NaN</td>\n",
       "      <td>...</td>\n",
       "      <td>11</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11.0</td>\n",
       "      <td>11</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>966005983</td>\n",
       "      <td>Brief</td>\n",
       "      <td>Average</td>\n",
       "      <td>4.6</td>\n",
       "      <td>NaN</td>\n",
       "      <td>Spring</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>full</td>\n",
       "      <td>silk</td>\n",
       "      <td>chiffon</td>\n",
       "      <td>...</td>\n",
       "      <td>1878</td>\n",
       "      <td>1892.0</td>\n",
       "      <td>1914</td>\n",
       "      <td>1924.0</td>\n",
       "      <td>1929.0</td>\n",
       "      <td>1941.0</td>\n",
       "      <td>1952</td>\n",
       "      <td>1955.0</td>\n",
       "      <td>1959.0</td>\n",
       "      <td>1963</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>876339541</td>\n",
       "      <td>cute</td>\n",
       "      <td>Low</td>\n",
       "      <td>4.5</td>\n",
       "      <td>NaN</td>\n",
       "      <td>Summer</td>\n",
       "      <td>o-neck</td>\n",
       "      <td>butterfly</td>\n",
       "      <td>chiffonfabric</td>\n",
       "      <td>chiffon</td>\n",
       "      <td>...</td>\n",
       "      <td>2032</td>\n",
       "      <td>2156.0</td>\n",
       "      <td>2252</td>\n",
       "      <td>2312.0</td>\n",
       "      <td>2387.0</td>\n",
       "      <td>2459.0</td>\n",
       "      <td>2544</td>\n",
       "      <td>2614.0</td>\n",
       "      <td>2693.0</td>\n",
       "      <td>2736</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "<p>5 rows × 59 columns</p>\n",
       "</div>"
      ],
      "text/plain": [
       "     Dress_ID    Style    Price  Rating Size  Season NeckLine SleeveLength  \\\n",
       "0  1006032852     Sexy      Low     4.6  NaN  Summer   o-neck    sleevless   \n",
       "1  1212192089   Casual      Low     0.0  NaN  Summer   o-neck        Petal   \n",
       "2  1190380701  vintage     High     0.0  NaN  Automn   o-neck         full   \n",
       "3   966005983    Brief  Average     4.6  NaN  Spring   o-neck         full   \n",
       "4   876339541     cute      Low     4.5  NaN  Summer   o-neck    butterfly   \n",
       "\n",
       "        Material FabricType  ... 24-09-2013_y 26-09-2013_y  28-09-2013_y  \\\n",
       "0            NaN    chiffon  ...         3554       3624.0          3706   \n",
       "1     microfiber        NaN  ...         2710       2942.0          3258   \n",
       "2       polyster        NaN  ...           11         11.0            11   \n",
       "3           silk    chiffon  ...         1878       1892.0          1914   \n",
       "4  chiffonfabric    chiffon  ...         2032       2156.0          2252   \n",
       "\n",
       "   30-09-2013_y  10-02-2013_y  10-04-2013_y  10-06-2013_y  10-08-2013_y  \\\n",
       "0        3746.0        3795.0        3832.0          3897        3923.0   \n",
       "1        3354.0        3475.0        3654.0          3911        4024.0   \n",
       "2          11.0          11.0          11.0            11          11.0   \n",
       "3        1924.0        1929.0        1941.0          1952        1955.0   \n",
       "4        2312.0        2387.0        2459.0          2544        2614.0   \n",
       "\n",
       "   10-10-2013_y  10-12-2013_y  \n",
       "0        3985.0          4048  \n",
       "1        4125.0          4277  \n",
       "2          11.0            11  \n",
       "3        1959.0          1963  \n",
       "4        2693.0          2736  \n",
       "\n",
       "[5 rows x 59 columns]"
      ]
     },
     "execution_count": 43,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Merge inp0 with inp1 into inp0. this is also called left merge.\n",
    "inp = pd.merge(left=inp0,right=inp1, how='left', left_on='Dress_ID', right_on='Dress_ID')\n",
    "inp.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 47,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "4201\n"
     ]
    }
   ],
   "source": [
    "# Now Drop the Date columns from inp0 as it is already combined into four seasons.\n",
    "#inp.drop(inp0.loc[:,'29-08-2013':'10-12-2013'].columns, axis= 1, inplace= True)\n",
    "print(sum(inp.isnull().sum()))"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Print the null count of inp0 to get the idea about the missing values in data set."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Dress_ID            0\n",
      "Style               0\n",
      "Price               2\n",
      "Rating              0\n",
      "Size              479\n",
      "Season              2\n",
      "NeckLine            3\n",
      "SleeveLength        2\n",
      "Material          119\n",
      "FabricType        256\n",
      "Decoration        224\n",
      "Pattern Type      102\n",
      "Recommendation      0\n",
      "29-08-2013_x        0\n",
      "31-08-2013_x        0\n",
      "09-02-2013_x        0\n",
      "09-04-2013_x        0\n",
      "09-06-2013_x        0\n",
      "09-08-2013_x        0\n",
      "09-10-2013_x        0\n",
      "09-12-2013_x        0\n",
      "14-09-2013_x        0\n",
      "16-09-2013_x        0\n",
      "18-09-2013_x        0\n",
      "20-09-2013_x        0\n",
      "22-09-2013_x        0\n",
      "24-09-2013_x        0\n",
      "26-09-2013_x      222\n",
      "28-09-2013_x        0\n",
      "30-09-2013_x      257\n",
      "10-02-2013_x      259\n",
      "10-04-2013_x      258\n",
      "10-06-2013_x        0\n",
      "10-08-2013_x      255\n",
      "10-10-2013_x      255\n",
      "10-12-2013_x        0\n",
      "29-08-2013_y        0\n",
      "31-08-2013_y        0\n",
      "09-02-2013_y        0\n",
      "09-04-2013_y        0\n",
      "09-06-2013_y        0\n",
      "09-08-2013_y        0\n",
      "09-10-2013_y        0\n",
      "09-12-2013_y        0\n",
      "14-09-2013_y        0\n",
      "16-09-2013_y        0\n",
      "18-09-2013_y        0\n",
      "20-09-2013_y        0\n",
      "22-09-2013_y        0\n",
      "24-09-2013_y        0\n",
      "26-09-2013_y      222\n",
      "28-09-2013_y        0\n",
      "30-09-2013_y      257\n",
      "10-02-2013_y      259\n",
      "10-04-2013_y      258\n",
      "10-06-2013_y        0\n",
      "10-08-2013_y      255\n",
      "10-10-2013_y      255\n",
      "10-12-2013_y        0\n",
      "dtype: int64\n"
     ]
    }
   ],
   "source": [
    "# Print the null count of each columns in inp0 dataframe i.e. combined data frame of inp0 and inp1 without date columns.\n",
    "print(inp.isnull().sum())"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "You can see that there are two types of variables one with a large number of missing values and another is very less number of missing values. These two columns can be categorized as:\n",
    "\n",
    "Type-1: Missing values are very less (around 2 or 3 missing values): Price, Season, NeckLine, SleeveLength, Winter and Autumn. \n",
    "\n",
    "Type-2: Missing values are large in numbers (more than 15%): Material, FabricType, Decoration and Pattern Type.\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 52,
   "metadata": {},
   "outputs": [
    {
     "ename": "ValueError",
     "evalue": "could not convert string to float: 'Low'",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mValueError\u001b[0m                                Traceback (most recent call last)",
      "Cell \u001b[1;32mIn[52], line 4\u001b[0m\n\u001b[0;32m      2\u001b[0m inp\u001b[38;5;241m.\u001b[39mdtypes\n\u001b[0;32m      3\u001b[0m \u001b[38;5;66;03m#convert objext type of price column into float type of data type and fill the null values with mean value of price column.\u001b[39;00m\n\u001b[1;32m----> 4\u001b[0m inp[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mPrice\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m=\u001b[39m inp[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mPrice\u001b[39m\u001b[38;5;124m'\u001b[39m]\u001b[38;5;241m.\u001b[39mastype(\u001b[38;5;28mfloat\u001b[39m)\n\u001b[0;32m      5\u001b[0m inp[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mPrice\u001b[39m\u001b[38;5;124m'\u001b[39m]\u001b[38;5;241m.\u001b[39mfillna(inp[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mPrice\u001b[39m\u001b[38;5;124m'\u001b[39m]\u001b[38;5;241m.\u001b[39mmean(), inplace\u001b[38;5;241m=\u001b[39m\u001b[38;5;28;01mTrue\u001b[39;00m)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\generic.py:6643\u001b[0m, in \u001b[0;36mNDFrame.astype\u001b[1;34m(self, dtype, copy, errors)\u001b[0m\n\u001b[0;32m   6637\u001b[0m     results \u001b[38;5;241m=\u001b[39m [\n\u001b[0;32m   6638\u001b[0m         ser\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39mcopy, errors\u001b[38;5;241m=\u001b[39merrors) \u001b[38;5;28;01mfor\u001b[39;00m _, ser \u001b[38;5;129;01min\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39mitems()\n\u001b[0;32m   6639\u001b[0m     ]\n\u001b[0;32m   6641\u001b[0m \u001b[38;5;28;01melse\u001b[39;00m:\n\u001b[0;32m   6642\u001b[0m     \u001b[38;5;66;03m# else, only a single dtype is given\u001b[39;00m\n\u001b[1;32m-> 6643\u001b[0m     new_data \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_mgr\u001b[38;5;241m.\u001b[39mastype(dtype\u001b[38;5;241m=\u001b[39mdtype, copy\u001b[38;5;241m=\u001b[39mcopy, errors\u001b[38;5;241m=\u001b[39merrors)\n\u001b[0;32m   6644\u001b[0m     res \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_constructor_from_mgr(new_data, axes\u001b[38;5;241m=\u001b[39mnew_data\u001b[38;5;241m.\u001b[39maxes)\n\u001b[0;32m   6645\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m res\u001b[38;5;241m.\u001b[39m__finalize__(\u001b[38;5;28mself\u001b[39m, method\u001b[38;5;241m=\u001b[39m\u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mastype\u001b[39m\u001b[38;5;124m\"\u001b[39m)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\internals\\managers.py:430\u001b[0m, in \u001b[0;36mBaseBlockManager.astype\u001b[1;34m(self, dtype, copy, errors)\u001b[0m\n\u001b[0;32m    427\u001b[0m \u001b[38;5;28;01melif\u001b[39;00m using_copy_on_write():\n\u001b[0;32m    428\u001b[0m     copy \u001b[38;5;241m=\u001b[39m \u001b[38;5;28;01mFalse\u001b[39;00m\n\u001b[1;32m--> 430\u001b[0m \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39mapply(\n\u001b[0;32m    431\u001b[0m     \u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mastype\u001b[39m\u001b[38;5;124m\"\u001b[39m,\n\u001b[0;32m    432\u001b[0m     dtype\u001b[38;5;241m=\u001b[39mdtype,\n\u001b[0;32m    433\u001b[0m     copy\u001b[38;5;241m=\u001b[39mcopy,\n\u001b[0;32m    434\u001b[0m     errors\u001b[38;5;241m=\u001b[39merrors,\n\u001b[0;32m    435\u001b[0m     using_cow\u001b[38;5;241m=\u001b[39musing_copy_on_write(),\n\u001b[0;32m    436\u001b[0m )\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\internals\\managers.py:363\u001b[0m, in \u001b[0;36mBaseBlockManager.apply\u001b[1;34m(self, f, align_keys, **kwargs)\u001b[0m\n\u001b[0;32m    361\u001b[0m         applied \u001b[38;5;241m=\u001b[39m b\u001b[38;5;241m.\u001b[39mapply(f, \u001b[38;5;241m*\u001b[39m\u001b[38;5;241m*\u001b[39mkwargs)\n\u001b[0;32m    362\u001b[0m     \u001b[38;5;28;01melse\u001b[39;00m:\n\u001b[1;32m--> 363\u001b[0m         applied \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mgetattr\u001b[39m(b, f)(\u001b[38;5;241m*\u001b[39m\u001b[38;5;241m*\u001b[39mkwargs)\n\u001b[0;32m    364\u001b[0m     result_blocks \u001b[38;5;241m=\u001b[39m extend_blocks(applied, result_blocks)\n\u001b[0;32m    366\u001b[0m out \u001b[38;5;241m=\u001b[39m \u001b[38;5;28mtype\u001b[39m(\u001b[38;5;28mself\u001b[39m)\u001b[38;5;241m.\u001b[39mfrom_blocks(result_blocks, \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39maxes)\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\internals\\blocks.py:758\u001b[0m, in \u001b[0;36mBlock.astype\u001b[1;34m(self, dtype, copy, errors, using_cow, squeeze)\u001b[0m\n\u001b[0;32m    755\u001b[0m         \u001b[38;5;28;01mraise\u001b[39;00m \u001b[38;5;167;01mValueError\u001b[39;00m(\u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mCan not squeeze with more than one column.\u001b[39m\u001b[38;5;124m\"\u001b[39m)\n\u001b[0;32m    756\u001b[0m     values \u001b[38;5;241m=\u001b[39m values[\u001b[38;5;241m0\u001b[39m, :]  \u001b[38;5;66;03m# type: ignore[call-overload]\u001b[39;00m\n\u001b[1;32m--> 758\u001b[0m new_values \u001b[38;5;241m=\u001b[39m astype_array_safe(values, dtype, copy\u001b[38;5;241m=\u001b[39mcopy, errors\u001b[38;5;241m=\u001b[39merrors)\n\u001b[0;32m    760\u001b[0m new_values \u001b[38;5;241m=\u001b[39m maybe_coerce_values(new_values)\n\u001b[0;32m    762\u001b[0m refs \u001b[38;5;241m=\u001b[39m \u001b[38;5;28;01mNone\u001b[39;00m\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\dtypes\\astype.py:237\u001b[0m, in \u001b[0;36mastype_array_safe\u001b[1;34m(values, dtype, copy, errors)\u001b[0m\n\u001b[0;32m    234\u001b[0m     dtype \u001b[38;5;241m=\u001b[39m dtype\u001b[38;5;241m.\u001b[39mnumpy_dtype\n\u001b[0;32m    236\u001b[0m \u001b[38;5;28;01mtry\u001b[39;00m:\n\u001b[1;32m--> 237\u001b[0m     new_values \u001b[38;5;241m=\u001b[39m astype_array(values, dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n\u001b[0;32m    238\u001b[0m \u001b[38;5;28;01mexcept\u001b[39;00m (\u001b[38;5;167;01mValueError\u001b[39;00m, \u001b[38;5;167;01mTypeError\u001b[39;00m):\n\u001b[0;32m    239\u001b[0m     \u001b[38;5;66;03m# e.g. _astype_nansafe can fail on object-dtype of strings\u001b[39;00m\n\u001b[0;32m    240\u001b[0m     \u001b[38;5;66;03m#  trying to convert to float\u001b[39;00m\n\u001b[0;32m    241\u001b[0m     \u001b[38;5;28;01mif\u001b[39;00m errors \u001b[38;5;241m==\u001b[39m \u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mignore\u001b[39m\u001b[38;5;124m\"\u001b[39m:\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\dtypes\\astype.py:182\u001b[0m, in \u001b[0;36mastype_array\u001b[1;34m(values, dtype, copy)\u001b[0m\n\u001b[0;32m    179\u001b[0m     values \u001b[38;5;241m=\u001b[39m values\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n\u001b[0;32m    181\u001b[0m \u001b[38;5;28;01melse\u001b[39;00m:\n\u001b[1;32m--> 182\u001b[0m     values \u001b[38;5;241m=\u001b[39m _astype_nansafe(values, dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n\u001b[0;32m    184\u001b[0m \u001b[38;5;66;03m# in pandas we don't store numpy str dtypes, so convert to object\u001b[39;00m\n\u001b[0;32m    185\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m \u001b[38;5;28misinstance\u001b[39m(dtype, np\u001b[38;5;241m.\u001b[39mdtype) \u001b[38;5;129;01mand\u001b[39;00m \u001b[38;5;28missubclass\u001b[39m(values\u001b[38;5;241m.\u001b[39mdtype\u001b[38;5;241m.\u001b[39mtype, \u001b[38;5;28mstr\u001b[39m):\n",
      "File \u001b[1;32mc:\\Users\\Karth\\anaconda3\\Lib\\site-packages\\pandas\\core\\dtypes\\astype.py:133\u001b[0m, in \u001b[0;36m_astype_nansafe\u001b[1;34m(arr, dtype, copy, skipna)\u001b[0m\n\u001b[0;32m    129\u001b[0m     \u001b[38;5;28;01mraise\u001b[39;00m \u001b[38;5;167;01mValueError\u001b[39;00m(msg)\n\u001b[0;32m    131\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m copy \u001b[38;5;129;01mor\u001b[39;00m arr\u001b[38;5;241m.\u001b[39mdtype \u001b[38;5;241m==\u001b[39m \u001b[38;5;28mobject\u001b[39m \u001b[38;5;129;01mor\u001b[39;00m dtype \u001b[38;5;241m==\u001b[39m \u001b[38;5;28mobject\u001b[39m:\n\u001b[0;32m    132\u001b[0m     \u001b[38;5;66;03m# Explicit copy, or required since NumPy can't view from / to object.\u001b[39;00m\n\u001b[1;32m--> 133\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m arr\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39m\u001b[38;5;28;01mTrue\u001b[39;00m)\n\u001b[0;32m    135\u001b[0m \u001b[38;5;28;01mreturn\u001b[39;00m arr\u001b[38;5;241m.\u001b[39mastype(dtype, copy\u001b[38;5;241m=\u001b[39mcopy)\n",
      "\u001b[1;31mValueError\u001b[0m: could not convert string to float: 'Low'"
     ]
    }
   ],
   "source": [
    "# Deal with the missing values of Type-1 columns: Price, Season, NeckLine, SleeveLength, Winter and Autumn.\n",
    "inp.dtypes\n",
    "#convert objext type of price column into float type of data type and fill the null values with mean value of price column.\n",
    "inp['Price'] = inp['Price'].astype(float)\n",
    "inp['Price'].fillna(inp['Price'].mean(), inplace=True)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Deal with the missing values for Type-2 columns: Material, FabricType, Decoration and Pattern Type.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Standardise value "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "In the given dataset, there are certain discrepancies with the categorical names such as irregular spellings. Choose the correct option of columns with irregular categories and update them.\n",
    " \n",
    "- Season, NeckLine\n",
    "- Price, Material\n",
    "- fabricType, Decoration\n",
    "- Season, SleeveLength\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "#correcting the spellings.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "#correcting the Spellings.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Univariate Analysis "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Categorical Unordered Univariate Analysis\n",
    " "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "There is a column named ‘Style’ in ‘Attribute Dataset’ which consists of the different style categories of the women apparels. Certain categories whose total sale is less than 50000 across all the seasons is considered under one single category as ‘Others’.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following categories in ‘Style’ column can be grouped into ‘Others’ category? and perform the grouping operation in the notebook for further analysis.\n",
    "- Flare, fashion\n",
    "- Novelty, bohemian\n",
    "- OL, fashion, work\n",
    "- Novelty, fashion, Flare\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"Style\" categories into \"Others\" which have less than 50000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "What is the percentage of “cute” and “Others” category in “Style” column in “Attribute DataSet” respectively?\n",
    "- 46%, 5%\n",
    "- 9%, 2.1%\n",
    "- 2.1%, 5%\n",
    "- 13.8%, 9%\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Calculate the percentage of each categories in the \"Style\" variable.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Similarly Club Neckline, SLeeve length categories into \"Others\" which have less than 50000 sales across all the seasons."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"Neckline\" categories into \"Others\" which have less than 50000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"Sleeve length\" categories into \"Others\" which have less than 50000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Club material, fabrictype, patterntype and decoration categories into \"Others\" which have less than 25000 sales across all the seasons"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"material\" categories into \"Others\" which have less than 25000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"fabric type\" categories into \"Others\" which have less than 25000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"patern type\" categories into \"Others\" which have less than 25000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Group \"decoration\" categories into \"Others\" which have less than 25000 sales across all the seasons.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Caregorical Ordered Univariate Analysis"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following is an unordered variable in “Attribute DataSet”.\n",
    "- Style\n",
    "- Price\n",
    "- Season\n",
    "- Size\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Numerical variable Univariate analysis:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "What is the approximate difference between the maximum value and 75th percentile in “Autumn” column.\n",
    "- Approx 54000\n",
    "- Approx 55000\n",
    "- Approx 52000\n",
    "- Approx 50000\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Describe the numerical variale: \"Autumn\".\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# plot the boxplot of \"Autumn\" column.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following season has the highest difference between the maximum value and 99th quantile of sales?\n",
    "- Winter\n",
    "- Summer\n",
    "- Spring\n",
    "- Autumn\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the maximum and 99th percentile of Winter season.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the maximum and 99th percentile of Summer season.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the maximum and 99th percentile of Spring season.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the maximum and 99th percentile of Autumn season.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Bivariate Analysis "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Numerical- Categorical analysis"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following “Price” category has the lowest average value of rating?\n",
    "- very-high\n",
    "- Medium\n",
    "- Low\n",
    "- High\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the Mean of Ratings for each Price category.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "What is the median of the rating of “vintage” category in Style column?\n",
    "- 4.6\n",
    "- 4.7\n",
    "- 4.55\n",
    "- 0.00\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the median of Ratings for each Style category.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following season has the highest average value of sale for “Recommendation” value equals to 1.\n",
    "- Summer\n",
    "- Spring\n",
    "- Autumn\n",
    "- Winter\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Summer sale vs Recommendation.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Spring sale vs Recommendation.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Autumn sale vs Recommendation.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Winter sale vs Recommendation.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Categorical categorical bivariate analysis\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following size categories has the highest positive recommendations?\n",
    "- Medium and extra large\n",
    "- Extra large and small\n",
    "- Free and small\n",
    "- Free and medium\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Size vs Recommendation.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Multivariate analysis "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following pair of “Style” and “Price” category has the highest average of positive recommendations?\n",
    "- Price: medium and style: vintage\n",
    "- Price: medium and style: cute\n",
    "- Price: very high and style: party\n",
    "- Price: low and style: sexy\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# plot the heat map of Style, price and Recommendation.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Which of the following material type has no recommendation in summer and winter seasons?\n",
    "- Mix and Milksilk\n",
    "- Nylon and Rayon\n",
    "- Microfiber and Silk\n",
    "- Milksilk and Microfiber\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# plot the heat map of Season, material and Recommendation.\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "base",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.13.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
