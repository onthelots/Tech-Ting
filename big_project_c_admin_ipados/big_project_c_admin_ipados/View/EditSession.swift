
//  EditSession.swift
//  big_project_c_admin_ipados
//
//  Created by Jae hyuk Yim on 2023/01/02.


import SwiftUI
import PhotosUI
import FirebaseStorage


struct EditSessionView: View {
    
    // MARK: - Seminar(Sesseion 정보) -> Store에서 나중에 가져올 예정
    @ObservedObject var seminarStore: SeminarStore
    
    // 바인딩을 해야할까? -> State 성격이 섞여서, 상위뷰랑 꼬일 수 있음
    var seminar: Seminar
    
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - Storage
    @State private var isPickerShowing = false
    @State private var selectedImage: UIImage?
    @State var selectedImages: [UIImage?] = []
    
    // MARK: - 이미지 받아오기(PhotoURL)
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var image: String = ""
    
    
    
    // 이미지 transaction 효과
    private let transaction: Transaction = .init(animation: .linear)
    
    //    MARK: - Name (타이틀)
    @State private var name: String = ""
    
    //     MARK: - date, startTime, endingTime (Date 피커)
    @State private var date: Date = Date()
    @State private var startingTime: String = ""
    @State private var endingTime: String = ""
    
    
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        //한국 시간으로 표시
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        //형태 변환
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }
    
    // MARK: - Category (카테고리)
    @State private var category: [String] = ["프론트","백엔드", "디자인", "블록체인"]
    // 카테고리 피커 돌리기
    @State private var selectedCategory: String = ""
    
    // MARK: - location 피커(3개 장소 임의로)
    @State private var location: String = ""
    @State private var locationUrl: String = ""
    
    // MARK: - hostName, hostImaeg, hostIntroduction (호스트 인포 - 프로필 사진, 강사소개)
    @State private var hostName: String = ""
    @State private var hostImage: String = ""
    @State private var hostIntroduce: String = ""
    
    @State private var isHostPickerShowing = false
    @State private var selectedHostImage: UIImage?
    
    // MARK: - seminarDescription, seminarCurriculum (세미나 상세내용, 상세 커리큘럼)
    @State private var seminarDescription: String = ""
    @State private var seminarCurriculum: String = ""
    
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 80) {
                    
                    // MARK: - 세미나 기본정보 제목 및 닫기(Dismiss) 버튼
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("세미나 기본정보")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.accentColor)
                            Spacer()
                            Button{
                                dismiss()
                            } label: {
                                Text("닫기")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .fontWeight(.bold)
                            .background {
                                Color.accentColor
                            }
                            .cornerRadius(10)
                        }
                    }
                    
                    
                    // MARK: - 세미나 기본정보 타이틀
                    VStack(alignment: .leading) {
                        Text("세미나 제목")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 50) {
                            Text("제목을 입력해주세요")
                                .font(.callout)
                            
                            TextField("제목 및 부제목", text: $name)
                        }
                    }
                    //MARK: - 이미지 피커
                    VStack (alignment: .leading)  {
                        Text("대표 이미지")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack {
                            Button {
                                isPickerShowing.toggle()
                            } label: {
                                ZStack {
                                    Image(systemName: "camera")
                                        .zIndex(1)
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                    
                                    Rectangle()
                                        .stroke(Color.accentColor, lineWidth: 1)
                                        .frame(width: 100, height: 100)
                                }
                            }
                            .padding(.trailing, 7)
                            .sheet(isPresented: $isPickerShowing) {
                                ImagePicker(image: $selectedImage)
                                    .onDisappear {
                                        if selectedImage != nil {
                                            selectedImages.append(selectedImage)
                                        }
                                    }
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(selectedImages, id: \.self) { image in
                                        Image(uiImage: image!)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(15)
                                            .padding(5)
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                    //MARK: - datePicker
                    VStack(alignment: .leading) {
                        
                        Text("일정")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 50) {
                            //TODO: - 날짜, 시간 DatePicker를 아이콘으로 만들고, 해당 값을 TextLabel로 작성되도록 하기
                            HStack {
                                HStack {
                                    Image(systemName: "calendar.circle")
                                    Text("날짜")
                                }
                                DatePicker(selection: $date, displayedComponents: .date) {
                                    Text("\(date, formatter: dateFormatter)")
                                }
                            }
                            .labelsHidden()
                            
                            Spacer()
                            
                            HStack {
                                HStack {
                                    Image(systemName: "clock")
                                    Text("시작시간")
                                    TextField("입력", text: $startingTime)
                                }
                                
                                HStack {
                                    Text("종료시간")
                                    TextField("입력", text: $endingTime)
                                }
                            }
                        }
                    }
                    
                    //MARK: - categoryPicker
                    VStack(alignment: .leading) {
                        
                        Text("유형")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        
                        HStack(spacing: 50) {
                            Text("세미나 유형을 선택해주세요")
                                .font(.callout)
                            
                            Picker("세미나 유형을 선택해주세요", selection: $selectedCategory) {
                                ForEach(category, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                    }
                    
                    // MARK: - Place
                    VStack(alignment: .leading) {
                        
                        Text("장소")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        
                        HStack(spacing: 50) {
                            Text("장소를 입력해주세요")
                                .font(.callout)
                            
                            TextField("세부장소", text: $location)
                            
                            Text("장소 URL을 입력해주세요")
                                .font(.callout)
                            
                            TextField("주소", text: $locationUrl)
                        }
                    }
                    
                    // MARK: - HostInfo ( 호스트 인포 - 프로필 사진, 강사소개)
                    VStack(alignment: .leading) {
                        Text("강사 소개")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack {
                            Button {
                                isHostPickerShowing.toggle()
                            } label: {
                                ZStack {
                                    if selectedHostImage == nil {
                                        Image(systemName: "camera")
                                            .zIndex(1)
                                            .font(.largeTitle)
                                            .foregroundColor(.accentColor)
                                        
                                        Circle()
                                            .stroke(Color.accentColor, lineWidth: 1)
                                            .frame(width: 100, height: 100)
                                    } else {
                                        Image(uiImage: selectedHostImage!)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(50)
                                    }
                                }
                            }
                            .padding(.trailing, 7)
                            .sheet(isPresented: $isHostPickerShowing) {
                                ImagePicker(image: $selectedHostImage)
                            }
                            
                        }
                        
                        HStack(spacing: 50) {
                            Text("성함 및 닉네임")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            TextField("강사 이름을 입력해주세요", text: $hostName)
                                .padding()
                                .textFieldStyle(.plain)
                        }
                    }
                    .padding(.bottom, -70)
                    
                    VStack(alignment: .leading) {
                        Text("소개글을 입력해주세요")
                            .font(.callout)
                            .foregroundColor(Color.gray)
                        TextEditor(text: $hostIntroduce)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .frame(height: 150)
                        
                    }
                    .padding(.vertical, 20)
                }
                    
                    
                    // MARK: - 세미나 상세내용
                    VStack(alignment: .leading) {
                        Text("세미나 상세 내용")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("구체적인 내용을 입력해주세요")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                            TextEditor(text: $seminarDescription)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .frame(height: 300)
                        }
                        
                    }
                    .padding(.vertical, 20)
                    
                    
                    // MARK: - 상세 커리큘럼
                    VStack(alignment: .leading) {
                        Text("상세 커리큘럼")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("세부 커리큘럼을 입력해주세요")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                            
                            TextEditor(text: $seminarCurriculum)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .frame(height: 300)

                        }
                    }
                    .padding(.vertical, 20)
                       
                    // MARK: - 세미나 등록하기 버튼 추가 (데이터)
                    VStack(alignment: .trailing) {
                        Button {
                            let id = UUID().uuidString
                            
                            seminarStore.editSeminar(seminar: Seminar(id: seminar.id,  image: [image], name: name, date: date, startingTime: startingTime, endingTime: endingTime, category: selectedCategory, location: location, locationUrl: locationUrl, hostName: hostName, hostImage: hostImage, hostIntroduction: hostIntroduce, seminarDescription: seminarDescription, seminarCurriculum: seminarCurriculum), selectedImages: selectedImages, selectedHostImage: selectedImage)
                            
                            dismiss()
                            
                        } label: {
                            Text("세미나 수정하기")
                                .foregroundColor(.white)
                                .padding()
                            // 등록하기
                        }
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .background {
                            Color.accentColor
                        }
                        .cornerRadius(10)
                    }

                }
                
            }
        
        .padding()
        .onAppear {
            name = seminar.name
            date = seminar.date
            startingTime = seminar.startingTime
            endingTime = seminar.endingTime
            selectedCategory = seminar.category
            location = seminar.location
            locationUrl = seminar.locationUrl
            hostName = seminar.hostName
            hostImage = seminar.hostImage
            hostIntroduce = seminar.hostIntroduction
            seminarDescription = seminar.seminarDescription
            seminarCurriculum = seminar.seminarCurriculum
        }
    }
}
    
    //MARK: - Async image를 나타내는 비동기 메서드
    @ViewBuilder
    private func imageView(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            Image(systemName: "photo")
                .frame(width: 100, height: 100)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                }
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        case .failure(let error):
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .foregroundColor(.red)
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
        @unknown default:
            Text("Unknown")
                .foregroundColor(.gray)
        }
    }
    

