import { textDirection } from "../types/datatable.type";

/**
 * 
 * @param valueArrayLength the length of the array used to create the table's coulumns 
 * @param textDirections the array of text directions proposed for each columns
 * @param defaultDirection the default direction in case none is given
 * @returns an array of text directions matching the table's column size 
 */
export default function createTextAlignmentArray(valueArrayLength: number, textDirections: Array<textDirection>, defaultDirection: textDirection): Array<textDirection> {
    
    let completeTextAlign: textDirection[] = [];
    if (textDirections.length > 1) {
        if (valueArrayLength < textDirections.length) {
            for (let i = 0; i < valueArrayLength; i++) {
                completeTextAlign.push(textDirections[i]);
            }
        } else if (valueArrayLength > textDirections.length) {
            for (let i = 0; i < valueArrayLength; i++) {
                if (textDirections[i]) {
                    completeTextAlign.push(textDirections[i]);
                } else {
                    completeTextAlign.push(defaultDirection);
                }
            }
        } else if (valueArrayLength == textDirections.length) {
            completeTextAlign = textDirections;
        }
    } else if (textDirections.length == 1) {
        for (let i = 0; i < valueArrayLength; i++) {
            completeTextAlign.push(textDirections[0]);
        }
    } else {
        for (let i = 0; i < valueArrayLength; i++) {
            completeTextAlign.push(defaultDirection);
        }
    }

    return completeTextAlign;
}