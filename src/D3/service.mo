import Filebase "types/filebase";
import Put "modules/put";
import Get "modules/get";
import InputTypes "types/input";
import OutputTypes "types/output";

module {

    public func updateOperation({
        d3 : Filebase.D3;
        updateOperationInput : InputTypes.UpdateOperationInputType;
    }) : async OutputTypes.UpdateOperationOutputType {

        switch (updateOperationInput) {
            case (#StoreFile(storeFileInput)) {
                return #StoreFileOutput(await Put.storeFile({ d3; storeFileInput; }))
            };
            case (#StoreFileMetadata(storeFileMetadataInput)) {
                return #StoreFileMetadataOutput(await Put.storeFileMetadata({ d3; storeFileMetadataInput; }))
            };
            case (#StoreFileChunk(storeFileChunkInput)) {
                return #StoreFileChunkOutput(await Put.storeFileChunk({ d3; storeFileChunkInput; }))
            };
        };

    };

    public func queryOperation({
        d3 : Filebase.D3;
        queryOperationInput : InputTypes.QueryOperationInputType;
    }) : OutputTypes.QueryOperationOutputType {

        switch (queryOperationInput) {
            case (#GetFileMetadata(getFileMetadataInput)) {
                return #GetFileMetadataOutput(Get.getFileMetadata({ d3; getFileMetadataInput; }))
            };
            case (#GetFile(getFileInput)) {
                return #GetFileOutput(Get.getFile({ d3; getFileInput; }))
            };
            case (#GetFileIds(getFileIdsInput)) {
                return #GetFileIdsOutput(Get.getFileIds({ d3; getFileIdsInput; }))
            };
        };
    };

};