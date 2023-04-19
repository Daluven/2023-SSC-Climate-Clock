import SwiftUI

struct SourceView: View {
    var body: some View {
        Form {
            Section {
                Text("Ehrenberg, R. Global forest survey finds trillions of trees. Nature (2015). https://doi.org/10.1038/nature.2015.18287")
                Text("Friedlingstein, P., O'sullivan, M., Jones, M. W., Andrew, R. M., Gregor, L., Hauck, J., ... & Zheng, B. (2022). Global carbon budget 2022. Earth System Science Data, 14(11), 4811-4900. https://doi.org/10.5194/essd-14-4811-2022")
                Text("Kaza, S., Yao, L., Bhada-Tata, P., & Van Woerden, F. (2018). What a waste 2.0: a global snapshot of solid waste management to 2050. World Bank Publications. http://hdl.handle.net/10986/30317")
                Text("Food and Agriculture Organization, AQUASTAT Core Database. Food and Agriculture Organization of the United Nations. Database accessed on [2023/03/03]. Available at: https://databank.worldbank.org/data/reports.aspx?dsid=2&series=ER.H2O.FWTL.K3")
            }
        }
        .navigationTitle("Sources and References")
    }
}
