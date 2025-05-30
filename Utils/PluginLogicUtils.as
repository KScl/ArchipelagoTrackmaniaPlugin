
int MapIndicesToId(int seriesI, int mapI, CheckTypes checkType){
    int mapBase = BASE_ID + seriesI * (MAX_MAP_LOCATIONS * MAX_MAPS_IN_SERIES) + mapI * (MAX_MAP_LOCATIONS);
    return mapBase + int(checkType);
}

vec3 MapIdToIndices(int id){
    int num = id - BASE_ID;
    int series = num / (MAX_MAP_LOCATIONS * MAX_MAPS_IN_SERIES);
    int map = (num % (MAX_MAP_LOCATIONS * MAX_MAPS_IN_SERIES)) / MAX_MAP_LOCATIONS; 
    int check = num % MAX_MAP_LOCATIONS;
    return vec3(series, map, check);
}

string StripArchipelagoColorCodes(const string &in message){
    bool inCode;
    string result = "";
    for (int i = 0; i < message.Length; i++){
        string char = message.SubStr(i,1);
        if (char == ""){
            if (i+1 < message.Length && message.SubStr(i+1,1) =="["){
                inCode = true;
            }
        }
        if (!inCode){
            result += char;
        }else{
            if (char == "m"){
                inCode = false;
            }
        }
    }
    return result;
}